locals {
  common_tags = {
    environment = var.environment_name
    owner       = var.owner_name
    ttl         = var.ttl
  }
}

resource "aws_elb" "main" {
  name            = var.name
  subnets         = var.subnet_ids
  security_groups = var.security_groups
  instances       = var.instances

  dynamic "listener" {
    for_each = var.listeners
    iterator = l
    content {
      instance_port     = l.value.instance_port
      instance_protocol = l.value.instance_protocol
      lb_port           = l.value.lb_port
      lb_protocol       = l.value.lb_protocol
    }
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = var.health_check_target
    interval            = 30
  }

  tags = merge(local.common_tags, var.tags == null ? {} : var.tags, { Name = var.name })
}
