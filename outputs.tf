output "lambda_iam" {
  value = "${aws_iam_role.iam_for_lambda.arn}"
}
output "lambda_arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}