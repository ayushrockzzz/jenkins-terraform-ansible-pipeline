terraform {
  backend "s3" {
    bucket         = "automation-team-pranad-ayush-jayant-s3-backend"
    key            = "automation-team"
    region         = "ap-south-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::278745882559:role/Automation-Team-Pranad-Ayush-JayantS3BackendRole"
    dynamodb_table = "automation-team-pranad-ayush-jayant-s3-backend"
  }
}