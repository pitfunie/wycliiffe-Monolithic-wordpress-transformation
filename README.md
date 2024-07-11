# Web App - Single Server to Elastic Evolution

Evolve a Monolithic Webserver to an architecture of a popular web application WordPress
The architecture will start with a manually built single instance, running the application and database
over the WAVEs, it will evolve scalable to a resilient architecture

The demo consists of 6 WAVEs, each implementing additional components of the architecture

- WAVE 1 - Setup the environment and manually build WordPress
- WAVE 2 - Automate the build using a Launch Template
- WAVE 3 - Split out the DB into RDS and Update the LT
- WAVE 4 - Split out the WP filesystem into EFS and Update the LT
- WAVE 5 - Enable elasticity via an ASG & ALB and fix WordPress (hardcoded WPHOME)
- WAVE 6 - Cleanup

![Architecture](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/ArchitectureEvolutionAll.png)

## Guide

- [WAVE1](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE1%20-%20MANUAL%20WORDPRESS%20BUILD.md)
- [WAVE2](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE2%20-%20%20COMPUTE%20LAUNCH%20TEMPLATE%20FOR%20AUTO-SCALE%20GROUP.md)
- [WAVE3](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE3%20-%203%20AZS%20AND%203%20TIERS%20FOR%20DATABASE%20SPLTTING%20TO%20AWS%20RDS%20LT.md)
- [WAVE4](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE4%20-%203%20AZS%20AND%203%20TIERS%20FOR%20STORAGE%20SPITTING%20TO%20AWS%20EFS%20LT.md)
- [WAVE5](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE5%20-%20%20ABSTRACTION%20%20DECOUPLE%20COMPUTE%20TO%20AWS%20ALB%20and%20AWS%20ASG%20LT.md)
- [WAVE6](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAV6%20-%20GUIDE%20TO%20CHANGE%20BUILD.md)


logged into AWS Region `us-east-1`
## 1-Click Installs

- [VPC](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/quickcreate?templateURL=https://raw.githubusercontent.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/main/01_CLOUDFORMATION_TEMPLATE/NYPets.yaml)


## Architecture Diagrams

- [WAVE1 - PNG](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE1%20-%20MANUAL%20WORDPRESS%20BUILD.png)
- [WAVE1 - PDF](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE1%20-%20MANUAL%20WORDPRESS%20BUILD.pdf)
- [WAVE2 - PNG](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE2%20-%20COMPUTE%20LAUNCH%20TEMPLATE%20FOR%20AUTO-SCALE%20GROUP.png)
- [WAVE2 - PDF](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE2%20-%20COMPUTE%20LAUNCH%20TEMPLATE%20FOR%20AUTO-SCALE%20GROUP.pdf)
- [WAVE3 - PNG](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE3%20-%203%20AZS%20AND%203%20TIERS%20FOR%20DATABASE%20SPLTTING%20TO%20AWS%20RDS%20LT.png)
- [WAVE3 - PDF](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE3%20-%203%20AZS%20AND%203%20TIERS%20FOR%20DATABASE%20SPLTTING%20TO%20AWS%20RDS%20LT.pdf)
- [WAVE4 - PNG](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE4%20-%203%20AZS%20AND%203%20TIERS%20FOR%20STORAGE%20SPITTING%20TO%20AWS%20EFS%20LT.png)
- [WAVE4 - PDF](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE4%20-%203%20AZS%20AND%203%20TIERS%20FOR%20STORAGE%20SPITTING%20TO%20AWS%20EFS%20LT.pdf)
- [WAVE5 - PNG](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE5%20-%20%20ABSTRACTION%20%20DECOUPLE%20COMPUTE%20TO%20AWS%20ALB%20and%20AWS%20ASG%20LT.png)
- [WAVE5 - PDF](https://github.com/pitfunie/wycliiffe-Monolithic-wordpress-transformation/blob/main/02_MIGRATION-TRANSFORMATION-GUDIE/WAVE5%20-%20%20ABSTRACTION%20%20DECOUPLE%20COMPUTE%20TO%20AWS%20ALB%20and%20AWS%20ASG%20LT.pdf)






