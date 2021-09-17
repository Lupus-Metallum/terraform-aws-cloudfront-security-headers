variable "tags" {
  default     = {}
  type        = map(string)
  description = "Tags to add to resouces created by this module"
}

variable "name" {
  type        = string
  description = "Name to use for resource names created by this module"
}

variable "description" {
  type        = string
  description = "Description to use for resource description created by this module"
  default     = "Adds security headers for Cloudfront"
}

variable "timeout" {
  type        = number
  default     = 1
  description = "Timeout to use for Lambda, defaults to 1ms"
}

variable "memory_size" {
  type        = number
  default     = 32
  description = "Memory to use for Lambda, defaults to 128mb"
}

variable "access_control_allow_origin" {
  type        = string
  default     = ""
  description = "Value to use for the Access-Control-Allow-Origin header, when not provided this header is omitted."
}

variable "access_control_allow_methods" {
  type        = string
  default     = ""
  description = "Value to use for the Access-Control-Allow-Methods header, when not provided this header is omitted."
}

variable "strict_transport_security" {
  type        = string
  default     = ""
  description = "Value to use for the Strict-Transport-Security header, when not provided this header is omitted."
}

variable "content_security_policy" {
  type        = string
  default     = ""
  description = "Value to use for the Content-Security-Policy header, when not provided this header is omitted."
}

variable "x_content_type_options" {
  type        = string
  default     = ""
  description = "Value to use for the X-Content-Type-Options header, when not provided this header is omitted."
}

variable "x_frame_options" {
  type        = string
  default     = ""
  description = "Value to use for the X-Frame-Options header, when not provided this header is omitted."
}

variable "x_xss_protection" {
  type        = string
  default     = ""
  description = "Value to use for the X-XSS-Protection header, when not provided this header is omitted."
}

variable "referrer_policy" {
  type        = string
  default     = ""
  description = "Value to use for the Referrer-Policy header, when not provided this header is omitted."
}