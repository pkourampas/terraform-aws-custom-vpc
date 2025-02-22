Table of Contents

- [Introduction](#introduction)
- [Appendix](#appendix)
  - [Amazon Policy](#amazon-policy)
  - [Generate EIP Custom Policy](#generate-an-eip-policy)

<br>

# Introduction

This repository serves as a Proof of Concept (POC) for creating a custom Virtual Private Cloud (VPC) on AWS. It leverages Terraform for infrastructure provisioning, OpenID Connect (OIDC) for authentication, and GitHub Actions for seamless CI/CD integration.

<br>

![Custom VPC](/images/Custom%20VPC.png)


# Appendix

## Amazon Policy

For this workshop, we will use the following policies to manage VPC resources while ensuring the role’s access within AWS is appropriately scoped and limited.

- **AmazonVPCFullAccess**
- **AmazonEC2FullAccess**
- **AmazonS3FullAccess**

## Generate an EIP Policy

To assign an Elastic IP (EIP) to a NAT Gateway, you must create a custom IAM policy with the necessary permissions. This policy ensures that the required actions can be performed securely and effectively.

[EIP Policy](/references/EIP_Policy.txt)
