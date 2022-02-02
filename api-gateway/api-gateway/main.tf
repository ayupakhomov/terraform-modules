
resource "aws_api_gateway_rest_api" "this" {
  count = var.create_api_gateway ? 1 : 0
  body  = var.body
  name  = var.api_gateway_name
  endpoint_configuration {
    types = [var.api_gateway_type]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
}

resource "aws_api_gateway_stage" "this" {
count = var.create_api_gateway_stage ? 1 : 0
  cache_cluster_enabled = false
  deployment_id         = aws_api_gateway_deployment.this[0].id
  rest_api_id           = aws_api_gateway_rest_api.this[0].id
  stage_name            = var.api_gateway_stage_name
  tags                  = var.default_stage_tags
  variables             = var.stage_variables
  xray_tracing_enabled  = false
}

resource "aws_api_gateway_deployment" "this" {
  count = var.create_api_gateway_deployment ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.this[0].id
  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this[0].body))
  }
  lifecycle {
    create_before_destroy = true
  }
}






resource "aws_api_gateway_usage_plan" "this" {
  count = var.create_api_gateway_usage_plan ? 1 : 0
    description = var.api_gateway_usage_plan_description
    name        = var.api_gateway_usage_plan_name
    api_stages {
        api_id = aws_api_gateway_rest_api.this[0].id
        stage  = aws_api_gateway_stage.this[0].stage_name
    }

    quota_settings {
        limit  = 1000000
        offset = 0
        period = "MONTH"
    }

    throttle_settings {
        burst_limit = 2000
        rate_limit  = 500
    }
}

resource "aws_api_gateway_api_key" "this" {
  
count = var.create_api_gateway_api_key ? 1 : 0
  name = var.api_gateway_api_key_name
}

resource "aws_api_gateway_usage_plan_key" "this" {
  count = var.create_api_gateway_usage_plan_key ? 1 : 0
  key_id        = aws_api_gateway_api_key.this[0].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.this[0].id
}

resource "aws_api_gateway_base_path_mapping" "this" {
  count = var.create_api_gateway_base_path_mapping ? 1 : 0
    api_id      = aws_api_gateway_rest_api.this[0].id
    domain_name = var.api_gateway_mapped_domain_name
    stage_name  = aws_api_gateway_stage.this[0].stage_name
    base_path = var.api_mapping_base_path
}
