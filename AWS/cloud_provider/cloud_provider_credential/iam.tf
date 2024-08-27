
#This resource creates the role with the assume role policy

resource "aws_iam_role" "cross_account_role" {
    name = "${local.prefix}-crossaccount"
    assume_role_policy = data.databricks_aws_assume_role_policy.this.json
}

#This resource creates the policy that provides Databricks with permissions to create EC2 instances in the compute plane

resource "aws_iam_policy" "policy" {
    name = "${local.prefix}-policy"
    policy = data.databricks_aws_crossaccount_policy.this.json
}

# this resource attaches the policy to the role

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "${local.prefix}-attachment"
  roles      = [aws_iam_role.cross_account_role.name]
  policy_arn = aws_iam_policy.policy.arn
}

