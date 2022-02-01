
resource "aws_api_gateway_rest_api" "this" {
  count = var.create_api_gateway ? 1 : 0
  body  = var.body
  name  = "example"
  endpoint_configuration {
    types = [var.api_gateway_type]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
}

resource "aws_api_gateway_stage" "this" {

  cache_cluster_enabled = false
  deployment_id         = aws_api_gateway_deployment.this.id
  rest_api_id           = aws_api_gateway_rest_api.this[0].id
  stage_name            = var.api_gateway_stage_name
  tags                  = var.default_stage_tags
  variables             = var.stage_variables
  xray_tracing_enabled  = false
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this[0].id
  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this[0].body))
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_base_path_mapping" "this" {
    api_id      = aws_api_gateway_rest_api.this[0].id
    domain_name = var.api_gateway_mapped_domain_name
    stage_name  = var.api_gateway_stage_name
}

resource "aws_api_gateway_domain_name" "this" {
    domain_name              = var.api_gateway_mapped_domain_name
    regional_certificate_arn = var.domain_name_certificate_arn
    security_policy          = "TLS_1_2"
    endpoint_configuration {
        types = [
            var.api_gateway_type,
        ]
    }
}

resource "aws_route53_record" "this" {
  zone_id = var.route53_zone_id
  name    = var.api_gateway_mapped_domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_api_gateway_domain_name.this.regional_domain_name]
}