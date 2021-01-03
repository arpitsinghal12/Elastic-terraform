provider "aws" {
	version 	= "~>2.0"
	region  	= var.region
	alias		= "region"
	assume_role {
   		 role_arn = "arn:aws:iam::293929962377:mfa/root-account-mfa-device"
  }
	profile = "testing"
}
