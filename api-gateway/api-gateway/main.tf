data "aws_s3_bucket_object" "this" {
  count = length(var.api_gateway_name)
  provider = aws.us-east-1
  bucket = var.bucket_name
  key    = var.api_gateway_defenition_file_name[count.index]
}

resource "aws_api_gateway_rest_api" "this" {
  count = var.create_api_gateway ? length(var.api_gateway_name) : 0
  body  = data.aws_s3_bucket_object.this[count.index].body
  name  = var.api_gateway_name[count.index]
  endpoint_configuration {
    types = [var.api_gateway_type]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
}

resource "aws_api_gateway_stage" "this" {
count = var.create_api_gateway_stage ? length(var.api_gateway_name) : 0
  cache_cluster_enabled = false
  deployment_id         = aws_api_gateway_deployment.this[count.index].id
  rest_api_id           = aws_api_gateway_rest_api.this[count.index].id
  stage_name            = var.api_gateway_stage_name
  tags                  = var.default_stage_tags
  variables             = var.stage_variables
  xray_tracing_enabled  = false
}

resource "aws_api_gateway_deployment" "this" {
  count = var.create_api_gateway_deployment ? length(var.api_gateway_name) : 0
  rest_api_id = aws_api_gateway_rest_api.this[count.index].id
  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this[count.index].body))
  }
  lifecycle {
    create_before_destroy = true
  }
}






resource "aws_api_gateway_usage_plan" "this" {
  count = var.create_api_gateway_usage_plan ? length(var.api_gateway_name) : 0
    description = var.api_gateway_usage_plan_description
    name        = var.api_gateway_usage_plan_name
    api_stages {
        api_id = aws_api_gateway_rest_api.this[count.index].id
        stage  = aws_api_gateway_stage.this[count.index].stage_name
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
  
count = var.create_api_gateway_api_key ? length(var.api_gateway_name) : 0
  name = var.api_gateway_api_key_name
}

resource "aws_api_gateway_usage_plan_key" "this" {
  count = var.create_api_gateway_usage_plan_key ? 1 : 0
  key_id        = aws_api_gateway_api_key.this[count.index].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.this[count.index].id
}

resource "aws_api_gateway_base_path_mapping" "this" {
  count = var.create_api_gateway_base_path_mapping ? length(var.api_gateway_name) : 0
    api_id      = aws_api_gateway_rest_api.this[count.index].id
    domain_name = var.api_gateway_mapped_domain_name
    stage_name  = aws_api_gateway_stage.this[count.index].stage_name
    base_path = var.api_mapping_base_path[count.index]
}
