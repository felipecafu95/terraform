
resource "aws_iam_instance_profile" "generic_profile" {
  name = "${var.profile_name}"
  role = "${aws_iam_role.generic_role.name}"
}

resource "aws_iam_role" "generic_role" {
  name = "${var.role_name}"

  assume_role_policy = "${file("${var.role}.json")}"
}

resource "aws_iam_policy" "generic_policy" {
  name        = "${var.policy_name}"
  path        = "/"
  description = "${var.description}"

  policy = "${file("${var.policy}.json")}"
}

resource "aws_iam_policy_attachment" "generic_attach" {
  name       = "${var.policy_attachment}"
  roles      = ["${aws_iam_role.generic_role.name}"]
  policy_arn = "${aws_iam_policy.generic_policy.arn}"
}