terraform {
  backend "s3" {
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "mycloud-devtf-backend-state"
  }
}
