data "aws_partition" "current" {}

resource "aws_cloudfront_function" "this" {
  name    = var.name
  runtime = "cloudfront-js-1.0"
  comment = var.description
  publish = true
  code    = templatefile("${path.module}/src/index.js.tpl", {
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
}
