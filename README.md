# Step-by-Step Guide for Blue/Green CodeDeploy using Terraform

This guide outlines the process of setting up a Blue/Green deployment using AWS CodeDeploy with Terraform. Follow these steps to achieve a seamless deployment for your application.

---

## Prerequisites
- Ensure you have Terraform installed and configured with AWS credentials.
- Docker installed locally for building and pushing images.
- Jenkins configured for CI/CD pipelines.

---

## Steps

### 1. **Elastic Container Registry (ECR)**
1. Used to Build and push your application’s Docker image to Amazon ECR.
   - Switch to the `blue_green_inout` repository where your application code resides.
   - Use the provided [Jenkinsfile](./Jenkinsfile) to create a Jenkins job for automating the Docker build and push process.
2. After successfully pushing the Docker image, proceed to create a **Task Definition** for your application in ECS.

### 2. **Task Definition**

### 3. **Amazon ECS Cluster**
1. Create an ECS Cluster using Terraform.
2. This cluster will host the ECS services for the Blue/Green deployment.

### 4. **Load Balancer**
1. Configure an Application Load Balancer (ALB) to handle traffic routing between the blue and green environments.
2. Ensure the ALB includes two target groups:
   - **Blue Target Group**: For the active environment.
   - **Green Target Group**: For the new version during deployment.

### 5. **ECS Service**
1. Deploy the ECS service using Terraform.
2. Associate the service with the ALB and its respective target groups.
3. Configure service autoscaling and health checks as needed.

### 6. **AWS CodeDeploy**
1. Create an AWS CodeDeploy application and deployment group.
2. Use Terraform to configure the deployment group with:
   - Blue/Green deployment settings.
   - The ECS service and load balancer target groups.
   - A service role with the necessary permissions.
3. Trigger deployments using CodeDeploy to switch traffic between the blue and green environments.

---

## Notes
- **Automating with Jenkins**: The Jenkins pipeline automates building, tagging, and pushing Docker images to ECR. Ensure you review and customize the [Jenkinsfile](./Jenkinsfile) to fit your project’s requirements.
- **Deployment Strategies**: For Blue/Green deployments, ensure proper configuration of health checks and rollback settings to minimize downtime and avoid deployment failures.

---

## Additional Resources
- [AWS CodeDeploy Documentation](https://docs.aws.amazon.com/codedeploy/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Amazon ECS User Guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)

---



 
