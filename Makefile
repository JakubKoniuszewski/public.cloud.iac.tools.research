# Terraform commands
terraform-init:
    terraform -chdir=terraform/$(CLOUD) init

terraform-plan:
    terraform -chdir=terraform/$(CLOUD) plan

terraform-apply:
    terraform -chdir=terraform/$(CLOUD) apply -auto-approve

# Pulumi commands
pulumi-preview:
    pulumi -C pulumi/$(CLOUD) preview

pulumi-up:
    pulumi -C pulumi/$(CLOUD) up --yes

pulumi-destroy:
    pulumi -C pulumi/$(CLOUD) destroy --yes

# Example usage: make terraform-apply CLOUD=aws
