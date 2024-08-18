AWS Custom VPC components:

- VPC CIDR
- Internet Gateway (Associate the Internet Gateway with VPC)
- Route Table (Associate the Route Table with Internet Gateway)
- Public Subnet (Associate the public subnet with Internet Gateway Route)
- Private Subnet
- 

- VPC CIDR = x.x.x.x/24 
- Subnets = x.x.x.x/27 

AWS VPC reserves the first four IP Addresses and the last IP address of each subnet. Keep in mind that it is the same like your ISP (Internet Service Provider) home router. 

For instance an example with CIDR: 10.0.0./24

10.0.0.0 (Network Address, reserved)

10.0.0.1 (Reserved for VPC router, Default Dateway)

10.0.0.2 (Reserved for DNS)

10.0.0.3 (Future Use)

10.0.0.255 (Broadcast address, reserved)

# NAT (Network Address Translate)

```
Create an Elastic IP Adddress and Assign it on NAT (Network Address Translate) in order for resources which are provisioned on private subnet to
gain internet access.
```

Resources

