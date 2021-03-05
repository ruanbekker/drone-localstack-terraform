# drone-localstack-terraform
Using Terraform to provision Mock Infra with Localstack on DroneCI

## Setup Gitea and Drone

Boot the stack:

```
$ docker-compose up -d
```

Create the following host entries (depends on your setup) to access the endpoints locally:

```
127.0.0.1  gitea
127.0.0.1  drone
127.0.0.1  drone-server
```

Access gitea on http://localhost:3000 and create your user `admin` and a password, then create a git repo and head over to drone on http://drone:80 and login with the credentials of gitea.

Refresh your repo's and enable your git repo in drone, and create the following secret name: `AWS_CREDENTIALS` and the value will be the base64 content of:

```
[localstack]
aws_access_key_id = example
aws_secret_access_key = example
output = json
region = us-east-1
```

To base64 encode it:

```
$ cat credentials | base64
```

Once you have the secret stored, add the `.drone.yml` file into your gitea repo and your pipeline should trigger.

You will notice theres a `infra/backend/` directory which has the terraform files to provision the remote s3 state bucket, which you can adjust the `.drone.yml` file to do it for you.

## Screenshot

![image](https://user-images.githubusercontent.com/567298/110138385-98830d00-7dda-11eb-86e8-e435bae61c4d.png)
