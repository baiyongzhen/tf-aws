# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file
# except in compliance with the License. A copy of the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is distributed on an "AS IS"
# BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under the License.
# https://www.terraform.io/docs/providers/aws/r/security_group.html
resource "aws_security_group" "sg_http_for_webapp_alb" {
  name        = "tf_http_for_webapp_alb"
  description = "Allow HTTP from anywhere to the webapp_alb"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpc_id}"

  tags {
    Name = "tf_http_for_webapp_alb"
  }
}

output "sg_http_for_webapp_alb_id" {
  value = "${aws_security_group.sg_http_for_webapp_alb.id}"
}
