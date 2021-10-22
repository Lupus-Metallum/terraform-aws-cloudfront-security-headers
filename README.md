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
