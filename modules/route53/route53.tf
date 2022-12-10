
#
resource "aws_route53_zone" "domain" {
  name = var.domain_name
}



resource "aws_route53_record" "cname_route53_record" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "www.${var.domain_name}"
  type    = var.cname_route53_record_type
  ttl     = var.cname_route53_record_ttl
  records = [var.alb_dns_name]
}
/*
resource "aws_route53_record" "alias_route53_record" {
  zone_id = aws_route53_zone.primary.zone_id #
  name    = "example.com" #
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = aws_lb.MYALB.zone_id
    evaluate_target_health = true
  }
}
}*/