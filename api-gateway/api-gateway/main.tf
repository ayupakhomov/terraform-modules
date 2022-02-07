data "aws_s3_bucket_object" "this" {
  count = length(var.api_gateway_params)
  provider = aws.s3
  bucket = var.bucket_name
  key    = var.api_gateway_params[count.index].api_gateway_defenition_file_name
}

resource "aws_api_gateway_rest_api" "this" {
  count = var.create_api_gateway ? length(var.api_gateway_params) : 0
  body  = data.aws_s3_bucket_object.this[count.index].body
  name  = var.api_gateway_params[count.index].api_gateway_name
  endpoint_configuration {
    types = [var.api_gateway_type]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
}

resource "aws_api_gateway_stage" "this" {
count = var.create_api_gateway ? length(var.api_gateway_params) : 0
  cache_cluster_enabled = false
  deployment_id         = aws_api_gateway_deployment.this[count.index].id
  rest_api_id           = aws_api_gateway_rest_api.this[count.index].id
  stage_name            = var.api_gateway_stage_name
  tags                  = var.default_stage_tags
  #variables             = var.api_gateway_params[count.index].stage_variables
  variables             = try(tomap(var.api_gateway_params[count.index].stage_variables), "")
  xray_tracing_enabled  = false
}

resource "aws_api_gateway_deployment" "this" {
  count = var.create_api_gateway ? length(var.api_gateway_params) : 0
  rest_api_id = aws_api_gateway_rest_api.this[count.index].id
  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this[count.index].body))
  }
  lifecycle {
    create_before_destroy = true
  }
}


## Usage plan and keys

resource "aws_api_gateway_usage_plan" "this" {
  count = var.create_api_gateway_usage_plan ? length(var.api_gateway_params) : 0
    description = var.api_gateway_usage_plan_description
    name        = "${var.api_gateway_usage_plan_name}_${var.api_gateway_params[count.index].api_gateway_name}"
    api_stages {
        api_id = aws_api_gateway_rest_api.this[count.index].id
        stage  = aws_api_gateway_stage.this[count.index].stage_name
    }

    quota_settings {
        limit  = var.api_gateway_usage_plan_quota_settings_limit
        offset = var.api_gateway_usage_plan_quota_settings_offset
        period = var.api_gateway_usage_plan_quota_settings_period
    }

    throttle_settings {
        burst_limit = var.api_gateway_usage_plan_throttle_settings_burst_limit
        rate_limit  = var.api_gateway_usage_plan_throttle_settings_rate_limit
    }
}


resource "aws_api_gateway_api_key" "this" {
  
  count = var.create_api_gateway_api_key ? 1 : 0
  name = "${var.api_gateway_api_key_name}_${count.index}"
}

resource "aws_api_gateway_usage_plan_key" "this" {
  count = "${var.create_api_gateway_usage_plan && var.create_api_gateway_api_key}" ? length(var.api_gateway_params) : 0
  key_id        = aws_api_gateway_api_key.this[0].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.this[count.index].id
}


## Custom domain and mappings
resource "aws_api_gateway_domain_name" "this" {
  count = var.create_api_gateway_domain_name ? 1 : 0
    domain_name              = var.api_gateway_mapped_domain_name
    regional_certificate_arn = var.api_gateway_domain_name_certificate_arn
    security_policy          = "TLS_1_2"
    endpoint_configuration {
        types = [
            var.api_gateway_mapped_domain_gateway_type,
        ]
    }
}

resource "aws_api_gateway_base_path_mapping" "this" {
  count = var.create_api_gateway_domain_name ? length(var.api_gateway_params) : 0
    api_id      = aws_api_gateway_rest_api.this[count.index].id
    domain_name = aws_api_gateway_domain_name.this[0].domain_name
    stage_name  = aws_api_gateway_stage.this[count.index].stage_name
    base_path = var.api_gateway_params[count.index].api_mapping_base_path
}