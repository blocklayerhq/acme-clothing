
Source code was forked with `git clone git@github.com:atulmy/crate.git crate`


MySQL database must be manually created. In dev environment:

```
echo create database crate | docker-compose exec db mysql -P foobar
```


## Production

### Setup EKS

### Setup ECR

Each repository has to be created manually in AWS console. Where should this be automated? Pipeline or infra setup


### Build API Docker image

- No Dockerfile, create one
	- This is to fit agreed-upon stack for demo
	- In a more "natural" situation, I would fit the pipeline to a deployment env which doesn't require Dockerfile?
- Use DOCKER_BUILDKIT=1

- Use production settings
	- DB settings might be different per pipeline
	- settings format is app-specific.
	- how to templatize / inject db settings in the pipeline?

### Setup RDS

	- Storage backend: MySQL-compatible
	- Deployment mode: Aurora Serverless (no DB admin)


### Deploy API to Kubernetes

	- Dowload custom kubectl binary from S3 bucket as instructed by AWS docs
	- Download custom aws-iam-authenticator binary from S3 bucket


	- Setup ingress with ALB
		- https://aws.amazon.com/blogs/opensource/kubernetes-ingress-aws-alb-ingress-controller/
		- https://kubernetes-sigs.github.io/aws-alb-ingress-controller/guide/walkthrough/echoserver/

