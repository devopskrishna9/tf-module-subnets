#module "subnets" {
#    source = "github.com/devopskrishna9/tf-module-subnets"
#    env = var.env
#    default_vpc_id = var.default_vpc_id
#
#    for_each = var.subnets
#    cidr_block = each.value.cidr_block
#    availability_zone = each.value.availability_zone
#    name = each.value.name
#    vpc_id = lookup(lookup(module.vpc, each.value.vpc_name,null), "vpc_id", null)
#    vpc_peering_connection_id = lookup(lookup(module.vpc, each.value.vpc_name,null), "vpc_peering_connection_id", null)
#    internet_gw_id = lookup(lookup(module.vpc, each.value.vpc_name,null), "internet_gw_id", null)
#    internet_gw = lookup(each.value, "internet_gw", false)
#    nat_gw = lookup(each.value, "nat_gw", false )
#  }


#resource "aws_subnet" "main" {
#  count = length(var.cidr_block)
#  cidr_block = var.cidr_block[count.index]
#  vpc_id = var.vpc_id
#  availability_zone = var.availability_zone[count.index]
#
#  tags = merge(
#    local.common_tags,
#    { Name = "${var.env}-${var.name}-subnet-${count.index+1}" }
#  )
#}
#
#resource "aws_route_table" "route_table" {
#  vpc_id = var.vpc_id
#
##  route {
##    cidr_block = "10.0.1.0/24"
##    gateway_id = aws_internet_gateway.
##  }
#
#  route {
#    cidr_block        = data.aws_vpc.default.cidr_block
#    vpc_peering_connection_id = var.vpc_peering_connection_id
#  }
#  tags = merge(
#    local.common_tags,
#    { Name = "${var.env}-${var.name}-route_table" }
#  )
#}
#
#resource "aws_route_table_association" "association" {
#  count = length(aws_subnet.main)
#  subnet_id      = aws_subnet.main.*.id[count.index]
#  route_table_id = aws_route_table.route_table.id
#}
#
#resource "aws_route" "internet_gw_route" {
#  count = var.internet_gw ? 1 :0
#  route_table_id            =  aws_route_table.route_table.id
#  destination_cidr_block    =  "0.0.0.0/0"
#  gateway_id = var.internet_gw_id
#}