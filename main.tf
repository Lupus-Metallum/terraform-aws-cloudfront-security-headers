data "aws_partition" "current" {}


resource "aws_iam_role" "execution_role" {
  name               = "${var.name}-execution-role"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": [
            "lambda.amazonaws.com",
            "edgelambda.amazonaws.com"
          ]
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
  tags               = var.tags
}

data "aws_iam_policy_document" "execution_role" {
  statement {
    sid = "AllowCloudWatchLogs"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    effect = "Allow"
    resources = [
      format(
        "arn:%s:logs:*::log-group:/aws/lambda/*:*:*",
        data.aws_partition.current.partition
      )
    ]
  }
}

resource "aws_iam_policy" "execution_role" {
  name   = "${var.name}-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.execution_role.json
}

resource "aws_iam_role_policy_attachment" "execution_role" {
  role       = aws_iam_role.execution_role.name
  policy_arn = aws_iam_policy.execution_role.arn
}

data "archive_file" "this" {
  type        = "zip"
  output_path = "${path.module}/deploy.zip"
  source {
    content = templatefile("${path.module}/src/index.js.tpl", {
      add_access_control_allow_origin    = length(var.access_control_allow_origin) > 0 ? true : false,
      access_control_allow_origin_value  = var.access_control_allow_origin,
      add_access_control_allow_methods   = length(var.access_control_allow_methods) > 0 ? true : false,
      access_control_allow_methods_value = var.access_control_allow_methods,
      add_strict_transport_security      = length(var.strict_transport_security) > 0 ? true : false,
      strict_transport_security_value    = var.strict_transport_security,
      add_content_security_policy        = length(var.content_security_policy) > 0 ? true : false,
      content_security_policy_value      = var.content_security_policy,
      add_x_content_type_options         = length(var.x_content_type_options) > 0 ? true : false,
      x_content_type_options_value       = var.x_content_type_options,
      add_x_frame_options                = length(var.x_frame_options) > 0 ? true : false,
      x_frame_options_value              = var.x_frame_options,
      add_x_xss_protection               = length(var.x_xss_protection) > 0 ? true : false,
      x_xss_protection_value             = var.x_xss_protection,
      add_referrer_policy                = length(var.referrer_policy) > 0 ? true : false,
      referrer_policy_value              = var.referrer_policy,
      add_feature_policy                = length(var.feature_policy) > 0 ? true : false,
      feature_policy_value              = var.feature_policy,
    })
    filename = "index.js"
  }
}

resource "aws_lambda_function" "this" {
  function_name    = var.name
  description      = var.description
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
  handler          = "index.handler"
  runtime          = "nodejs12.x"
  role             = aws_iam_role.execution_role.arn
  timeout          = var.timeout
  memory_size      = var.memory_size
  publish          = true
  tags             = var.tags
  depends_on = [
    data.archive_file.this
  ]
}