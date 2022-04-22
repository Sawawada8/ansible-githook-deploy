FROM python:3.10.1-slim-buster

RUN apt-get update -y && \
    apt-get -y install openssh-client vim jq && \
    pip install ansible boto3 botocore \
    pip install awscli

# CMD [ "python3" ]
