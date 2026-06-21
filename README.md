#####################################
# STEP 0: WORKSPACE (ENV SETUP)
#####################################

terraform workspace new dev        # Run only once
terraform workspace select dev

#####################################
# STEP 1: INITIALIZE
#####################################

terraform init

#####################################
# STEP 2: FORMAT CODE
#####################################

terraform fmt -recursive

#####################################
# STEP 3: VALIDATE CONFIG
#####################################

terraform validate

#####################################
# STEP 4: PLAN (MULTIPLE OPTIONS)
#####################################

# Basic plan
terraform plan

# Plan with inline variable
terraform plan -var="environment=dev"

# Plan with tfvars file (recommended)
terraform plan -var-file="dev.tfvars"

# Plan with structured env folder + save plan
terraform plan \
  -var-file="env/dev.tfvars" \
  -out="tfplan"

#####################################
# STEP 5: APPLY (MULTIPLE OPTIONS)
#####################################

# Standard apply (interactive)
terraform apply

# Quick apply (not recommended for prod)
terraform apply -auto-approve

# Apply specific resource (debug only)
terraform apply -target=aws_instance.web

# Apply using saved plan (BEST PRACTICE)
terraform apply "tfplan"

#####################################
# STEP 6: OUTPUTS
#####################################

terraform output

#####################################
# STEP 7: STATE INSPECTION
#####################################

terraform state list
terraform state show aws_instance.web

#####################################
# STEP 8: DESTROY (CLEANUP)
#####################################

# Basic destroy
terraform destroy

# Destroy with tfvars
terraform destroy \
  -var-file="env/dev.tfvars"

# Force destroy (use carefully)
terraform destroy \
  -var-file="env/dev.tfvars" \
  -auto-approve