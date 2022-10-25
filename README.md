# terraform-aws-cloudfront-security-headers
Terraform module to create a Lambda@Edge function to add best practice security headers and support HSTS preload requirements.

## Example
``` terraform
module "security_headers" {
  source                             = "Lupus-Metallum/cloudfront-security-headers/aws"
  version                            = "3.0.0"
  name                               = "AddSecurityHeaders"
  access_control_allow_methods       = "POST, GET, OPTIONS"
  access_control_allow_origin        = "https://example.com"
  content_security_policy            = "default-src 'self:'; img-src 'self'; script-src 'unsafe-inline'; style-src 'unsafe-inline'; object-src 'none'"
  referrer_policy                    = "same-origin"
  strict_transport_security          = "max-age=63072000; includeSubdomains; preload"
  x_content_type_options             = "nosniff"
  x_frame_options                    = "DENY"
  x_xss_protection                   = "1; mode=block"
  feature_policy                     = ""
}
```

<!-- BEGIN_TF_DOCS -->

<img src="https://raw.githubusercontent.com/Lupus-Metallum/brand/master/images/logo.jpg" width="400"/>



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_function) | resource |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name to use for resource names created by this module | `string` | n/a | yes |
| <a name="input_access_control_allow_methods"></a> [access\_control\_allow\_methods](#input\_access\_control\_allow\_methods) | Value to use for the Access-Control-Allow-Methods header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_access_control_allow_origin"></a> [access\_control\_allow\_origin](#input\_access\_control\_allow\_origin) | Value to use for the Access-Control-Allow-Origin header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_content_security_policy"></a> [content\_security\_policy](#input\_content\_security\_policy) | Value to use for the Content-Security-Policy header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Description to use for resource description created by this module | `string` | `"Adds security headers for Cloudfront"` | no |
| <a name="input_feature_policy"></a> [feature\_policy](#input\_feature\_policy) | Value to use for the Feature-Policy header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_referrer_policy"></a> [referrer\_policy](#input\_referrer\_policy) | Value to use for the Referrer-Policy header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_strict_transport_security"></a> [strict\_transport\_security](#input\_strict\_transport\_security) | Value to use for the Strict-Transport-Security header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_x_content_type_options"></a> [x\_content\_type\_options](#input\_x\_content\_type\_options) | Value to use for the X-Content-Type-Options header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_x_frame_options"></a> [x\_frame\_options](#input\_x\_frame\_options) | Value to use for the X-Frame-Options header, when not provided this header is omitted. | `string` | `""` | no |
| <a name="input_x_xss_protection"></a> [x\_xss\_protection](#input\_x\_xss\_protection) | Value to use for the X-XSS-Protection header, when not provided this header is omitted. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
<!-- END_TF_DOCS -->