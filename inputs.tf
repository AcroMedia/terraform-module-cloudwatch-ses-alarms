variable "critical_sns_arn" {
  description = "The ARN of the SNS topic to send critical alerts to"
  type       = string
}

variable "warning_sns_arn" {
  description = "The ARN of the SNS topic to send warning alerts to"
  type       = string
}

variable "statistic" {
  description = "Use 'Maximum' for sites with low volume, 'Average' for sites with high volume"
  default   = "Maximum"
  type        = string
}

variable tags {
    description = "A map of tags to add to all resources"
    type        = map(string)
    default     = {}
}
