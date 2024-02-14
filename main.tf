resource "aws_autoscaling_group" "terramino" {
  min_size             = 2
  max_size             = 5
  desired_capacity     = 3
  launch_configuration = aws_launch_configuration.terramino.name
  vpc_zone_identifier  = [aws_subnet.public_subnet.id]
}



resource "aws_lb" "terramino" {
  name               = "learn-asg-terramino-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public-sg.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.public1_subnet.id]
}


resource "aws_launch_configuration" "terramino" {
  name_prefix     = "learn-terraform-aws-asg-"
  image_id        = "ami-052efd3df9dad4825"
  instance_type   = "t2.medium"
  security_groups = [aws_security_group.public-sg.id]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_lb_listener" "terramino" {
  load_balancer_arn = aws_lb.terramino.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terramino.arn
  }
}


resource "aws_lb_target_group" "hashicups" {
  name     = "learn-asg-hashicups"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test_vpc.id
}


resource "aws_lb_target_group" "terramino" {
  name     = "learn-asg-terramino"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test_vpc.id
}

resource "aws_autoscaling_attachment" "terramino" {
  autoscaling_group_name = aws_autoscaling_group.terramino.id
  alb_target_group_arn   = aws_lb_target_group.terramino.arn
}

