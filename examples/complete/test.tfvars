location = "northeurope"

class_env               = "dev"
instance_env            = "001"
instance_resource       = "001"
logical_product_family  = "demo"
logical_product_service = "backup"

tags = {
  environment = "test"
  terraform   = "true"
  provisioner = "terraform"
}
