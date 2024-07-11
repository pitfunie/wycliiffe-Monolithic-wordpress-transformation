# Advanced Demo - Web App - Single Server to Elastic Evolution

In this advanced demo lesson you are going to evolve the architecture of a popular web application wordpress
The architecture will start with a manually built single instance, running the application and database
over the WAVEs of the demo you will evolve this until its a scalable and resilient architecture

The demo consists of 6 WAVEs, each implementing additional components of the architecture

- WAVE 1 - Setup the environment and manually build wordpress
- WAVE 2 - Automate the build using a Launch Template
- WAVE 3 - Split out the DB into RDS and Update the LT
- WAVE 4 - Split out the WP filesystem into EFS and Update the LT
- WAVE 5 - Enable elasticity via a ASG & ALB and fix wordpress (hardcoded WPHOME)
- WAVE 6 - Cleanup

![Architecture](https://github.com/acantril/learn-cantrill-io-labs/raw/master/aws-elastic-wordpress-evolution/ArchitectureEvolutionAll.png)

## Instructions

- [WAVE1](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE1%20-%20Setup%20and%20Manual%20wordpress%20build.md)
- [WAVE2](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE2%20-%20Automate%20the%20build%20using%20a%20Launch%20Template.md)
- [WAVE3](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE3%20-%20Add%20RDS%20and%20Update%20the%20LT.md)
- [WAVE4](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE4%20-%20Add%20EFS%20and%20Update%20the%20LT.md)
- [WAVE5](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE5%20-%20Add%20an%20ELB%20and%20ASG.md)
- [WAVE6](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE6%20-%20CLEANUP.md)


## 1-Click Installs
Make sure you are logged into AWS and in `us-east-1`

- [VPC](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/quickcreate?templateURL=https://learn-cantrill-labs.s3.amazonaws.com/aws-elastic-wordpress-evolution/NYPETSVPC.yaml&stackName=NYPETSVPC)

## Video Guides

- [HERE](https://youtu.be/wWIFJvxoWb0)


## Architecture Diagrams

- [WAVE1 - PNG](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE1%20-%20SINGLE%20SERVER%20MANUAL.png)
- [WAVE1 - PDF](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE1%20-%20SINGLE%20SERVER%20MANUAL.pdf)
- [WAVE2 - PNG](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE2%20-%20SINGLE%20SERVER%20LT.png)
- [WAVE2 - PDF](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE2%20-%20SINGLE%20SERVER%20LT.pdf)
- [WAVE3 - PNG](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE3%20-%20SPLIT%20OUT%20RDS.png)
- [WAVE3 - PDF](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE3%20-%20SPLIT%20OUT%20RDS.pdf)
- [WAVE4 - PNG](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE4%20-%20SPLIT%20OUT%20EFS.png)
- [WAVE4 - PDF](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE4%20-%20SPLIT%20OUT%20EFS.pdf)
- [WAVE5 - PNG](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE5%20-%20ASG%20%26%20ALB.png)
- [WAVE5 - PDF](https://github.com/acantril/learn-cantrill-io-labs/blob/master/aws-elastic-wordpress-evolution/02_LABINSTRUCTIONS/WAVE5%20-%20ASG%20%26%20ALB.pdf)






