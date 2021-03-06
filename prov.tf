provider "aws" {

region = "ap-south-1"
profile = "default"

} 

resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  key_name = "adarsha"

  tags = {
    Name = "webserver1"
  }
}
resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.web.availability_zone
  size              = 10

  tags = {
    Name = "webserver"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}

