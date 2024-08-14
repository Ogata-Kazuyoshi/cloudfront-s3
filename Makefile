
iac-base-deploy:
	aws cloudformation create-stack --stack-name ogata-cloudformation-base \
	--template-body file://cloudformation/cloudformation-base.yml \
	--capabilities CAPABILITY_NAMED_IAM \

iac-base-update:
	aws cloudformation update-stack --stack-name ogata-cloudformation-base \
	--template-body file://cloudformation/cloudformation-base.yml \
	--capabilities CAPABILITY_NAMED_IAM \

iac-role-deploy:
	aws cloudformation create-stack --stack-name ogata-cloudformation-iam-role \
	--template-body file://cloudformation/cloudformation-iam-role.yml \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameters ParameterKey=GithubAccount,ParameterValue=$(GITHUB_ACCOUNT) \
	             ParameterKey=GithubRepository,ParameterValue=$(GITHUB_REPOSITORY) \

iac-role-update:
	aws cloudformation update-stack --stack-name ogata-cloudformation-iam-role \
	--template-body file://cloudformation/cloudformation-iam-role.yml \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameters ParameterKey=GithubAccount,ParameterValue=$(GITHUB_ACCOUNT) \
	             ParameterKey=GithubRepository,ParameterValue=$(GITHUB_REPOSITORY) \

iac-wafacl-deploy:
	aws cloudformation create-stack --stack-name ogata-cloudformation-wafacl \
	--template-body file://cloudformation/cloudformation-wafacl.yml \
	--capabilities CAPABILITY_NAMED_IAM \
	--region $(WAF_ACL_REGION)

iac-wafacl-update:
	aws cloudformation update-stack --stack-name ogata-cloudformation-wafacl \
	--template-body file://cloudformation/cloudformation-wafacl.yml \
	--capabilities CAPABILITY_NAMED_IAM \
	--region $(WAF_ACL_REGION)

iac-cloudfront-deploy:
	aws cloudformation create-stack --stack-name ogata-cloudformation-cloudfront \
	--template-body file://cloudformation/cloudformation-cloudfront.yml \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameters ParameterKey=WAFWebACLArn,ParameterValue=$(WAF_ACL_ARN) \
	--region $(CLOUDFRONT_REGION)

iac-cloudfront-update:
	aws cloudformation update-stack --stack-name ogata-cloudformation-cloudfront \
	--template-body file://cloudformation/cloudformation-cloudfront.yml \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameters ParameterKey=WAFWebACLArn,ParameterValue=$(WAF_ACL_ARN) \
	--region $(CLOUDFRONT_REGION)