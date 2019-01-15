resource "aws_iam_role" "iam_for_lambda" {
  name = "${var.lambda_iam_name}"

  assume_role_policy = "${var.lambda_iam_policy_file}"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = "${var.lambda_filename}"
  function_name    = "${var.lambda_function_name}"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "${var.handler}"
  source_code_hash = "${var.lambda_hash}"
  runtime          = "${var.runtime}"

  environment {
    variables = {
      Name          = "${var.lambda_function_name}"
      Environment   = "${var.env}"
    }
  }
}