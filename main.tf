resource "aws_cloudwatch_metric_alarm" "ses-bounce-rate-warning" {
  provider = aws.src
  alarm_name                = "ses-bounce-rate-warning"
  alarm_description         = "Bounce rate >=5% over the last 12 hours"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Reputation.BounceRate"
  namespace                 = "AWS/SES"
  period                    = 60 * 60 * 12
  statistic                 = var.statistic
  threshold                 = 5 / 100
  alarm_actions             = [var.warning_sns_arn]
  insufficient_data_actions = [var.warning_sns_arn]
  ok_actions                = [var.warning_sns_arn]
  treat_missing_data        = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "ses-bounce-rate-critical" {
  provider = aws.src
  alarm_name                = "ses-bounce-rate-critical"
  alarm_description         = "Bounce rate >=7% over the last 12 hours"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Reputation.BounceRate"
  namespace                 = "AWS/SES"
  period                    = 60 * 60 * 12
  statistic                 = var.statistic
  threshold                 = 7 / 100
  alarm_actions             = [var.critical_sns_arn]
  ok_actions                = [var.critical_sns_arn]
  insufficient_data_actions = [var.critical_sns_arn]
  treat_missing_data        = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "ses-complaint-rate-warning" {
  provider = aws.src
  alarm_name                = "ses-complaint-rate-warning"
  alarm_description         = "Complaint rate >=0.3% over the last 12 hours"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Reputation.ComplaintRate"
  namespace                 = "AWS/SES"
  period                    = 60 * 60 * 12
  statistic                 = var.statistic
  threshold                 = 0.3 / 100
  alarm_actions             = [var.warning_sns_arn]
  insufficient_data_actions = [var.warning_sns_arn]
  ok_actions                = [var.warning_sns_arn]
  treat_missing_data        = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "ses-complaint-rate-critical" {
  provider = aws.src
  alarm_name                = "ses-complaint-rate-critical"
  alarm_description         = "Complaint rate >=0.4% over the last 12 hours"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Reputation.ComplaintRate"
  namespace                 = "AWS/SES"
  period                    = 60 * 60 * 12
  statistic                 = var.statistic
  threshold                 = 0.4 / 100
  alarm_actions             = [var.critical_sns_arn]
  ok_actions                = [var.critical_sns_arn]
  insufficient_data_actions = [var.critical_sns_arn]
  treat_missing_data        = "notBreaching"
}
