output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_pub" {
  value = aws_subnet.public.*.id
}
output "subnet_pvt" {
  value = aws_subnet.private.*.id
}
output "subnet_db" {
  value = aws_subnet.database.*.id
}
output "subnet_eks_private" {
  value = aws_subnet.eks_private.*.id
}
output "subnet_eks_public" {
  value = aws_subnet.eks_public.*.id
}