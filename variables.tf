variable "tags" {
  default     = {}
  type        = map(string)
  description = "Tags to add to resouces created by this module"
}

variable "name" {
  type        = string
  description = "Name to use for resource names created by this module"
}

variable "timeout" {
  type        = number
  default     = 1
  description = "Timeout to use for Lambda, defaults to 1ms"
}

variable "memory_size" {
  type        = number
  default     = 128
  description = "Memory to use for Lambda, defaults to 128mb"
}