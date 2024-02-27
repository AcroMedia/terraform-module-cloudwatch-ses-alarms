# terraform-module-cloudwatch-ses-alarms

Example implementation:
```yaml 

resource "aws_sns_topic" "email" {
  provider = aws
  name = "email"
}

resource "aws_sns_topic_subscription" "subscriber" {
  provider  = aws
  topic_arn = aws_sns_topic.email.arn
  protocol  = "email"
  endpoint  = "somebody@example.com"
}

module "cloudwatch_ses_alarms" {
  source = "git@github.com:AcroMedia/terraform-module-cloudwatch-ses-alarms.git?ref=main"  # ?ref= can also point at a version tag.
  providers = {
    aws.src = aws # or your aliased aws provider
  }
  critical_sns_arn = aws_sns_topic.email.arn
  warning_sns_arn = aws_sns_topic.email.arn
}

```
