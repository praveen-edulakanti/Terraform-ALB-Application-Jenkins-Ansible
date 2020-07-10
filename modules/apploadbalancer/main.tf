resource "aws_lb" "LoadBalancer" {
  name               = var.LoadBalancerName
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnetID
  security_groups    = [var.LoadBalSecurityGrpID]
  enable_deletion_protection = false

  tags = {
           Name = format("${var.environment}-%s", var.LoadBalancerName)
	Environment = var.environment
      Project   = var.project
	Terraformed = "True"
  }
}

resource "aws_lb_target_group" "TargetGroup" {
 
  count    = length(var.TargetGroupNames)
  name     = format("${var.environment}-%s", lookup(var.TargetGroupNames[count.index], "name"))
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
 
  
  stickiness {
    enabled = false
    type = "lb_cookie"
  }
  
  tags = {
	Name= format("${var.environment}-%s", lookup(var.TargetGroupNames[count.index],"name"))
	Environment = var.environment
      Project   = var.project
	Terraformed = "True"
  }
}


resource "aws_lb_listener" "Listener80" {
  load_balancer_arn   = aws_lb.LoadBalancer.arn
  port                = 80
  protocol            = "HTTP"

  default_action {

	type = "redirect"
	redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
	
  }
}

resource "aws_lb_listener" "Listener443" {
  load_balancer_arn = aws_lb.LoadBalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::863896359115:server-certificate/EdulakantiInfoCertificate"
  #certificate_arn   = " arn:aws:acm:ap-south-1:863896359115:certificate/13492c39-a0af-4d9d-a0da-9053c84b9227"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TargetGroup[1].arn
  }
}

#Autoscaling no instance to select
resource "aws_lb_target_group_attachment" "https" {
  count = length(var.TargetGroupNames)
  target_group_arn = aws_lb_target_group.TargetGroup.*.arn[count.index]
  target_id = var.PrivateInstanceIds[0]
  port             = 80
}

resource "aws_lb_target_group_attachment" "https-1" {
  count = length(var.TargetGroupNames)
  target_group_arn = aws_lb_target_group.TargetGroup.*.arn[count.index]
  target_id = var.PrivateInstanceIds[1]
  port             = 80
}

#Application Load Balancer
resource "aws_lb_listener_rule" "ForwardRulesLB" {
  count = length(var.AlbForwardRules)
  listener_arn  = aws_lb_listener.Listener443.arn
  priority      = lookup(var.AlbForwardRules[count.index], "priority")

  action {
    type             = "forward"
    target_group_arn =  aws_lb_target_group.TargetGroup.*.arn[count.index]
  }
  
  condition {
    field  =  lookup(var.AlbForwardRules[count.index], "field")
    values = [lookup(var.AlbForwardRules[count.index], "values")]
  }
}