data "aws_caller_identity" "current" {}

resource "aws_instance" "ec2_test" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.keypair_test.key_name}"

  vpc_security_group_ids = ["${aws_security_group.ec2_sg_test.id}"]
  subnet_id              = "${var.subnet_id_test[0]}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.volume_size}"
    delete_on_termination = true
  }

  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name        = "ec2-${var.env}"
    Environment = "${var.env}"
    ServerType  = "ec2-test"
    Stage       = "${var.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# resource "aws_eip" "saai_micro_eip_instance" {
#   vpc = true

#   instance = "${aws_instance.saai_micro_instance.id}"
#   tags = {
#     Name  = "${var.project}-micro-instance-${var.env}"
#     Stage = "${var.env}"
#   }
# }
