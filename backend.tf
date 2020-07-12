terraform {
 backend "s3" {
	encrypt = true
	bucket = "praveen-terraform-remote-state-storage-s3"
	region = "ap-south-1"
	key    = "terraform.tfstate"
 }
}