

resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.vpc_security_group_ids
#  subnets            = [for subnet in aws_subnet.public : subnet.id]
  subnets = var.subnet_id

  enable_deletion_protection = var. enable_deletion_protection

#  access_logs {
#    bucket  = aws_s3_bucket.lb_logs.bucket
#    prefix  = "test-lb"
#    enabled = true
#  }

  tags = var.tags
}


resource "aws_lb_target_group" "alb" {
  name        = "${var.alb_name}-lb-alb-tg"

  #target_type = "alb"
  port        = var.listener_port
  protocol    = var.listener_protocol
  vpc_id      = var.vpc_id

  stickiness {
    type = "lb_cookie"
  }
    # Alter the destination of the health check to be the login page.
  health_check {
    path = "/login"
    port = 80
  }
}


resource "aws_lb_target_group_attachment" "alb" {
  target_group_arn = aws_lb_target_group.alb.arn
  target_id        = var.target_id
  port             = 80
}


resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb.arn
  }
}

#variable "certificate_arn" {}
/*
resource "aws_lb_listener" "listener_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb.arn
  }
}*/

/*
resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.listener_http.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb.arn
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }

  condition {
    host_header {
      values = ["example.com"]
    }
  }
}
*/

