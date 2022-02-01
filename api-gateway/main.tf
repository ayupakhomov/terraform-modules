
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
  stage_name            = var.stage_name
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