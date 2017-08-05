FROM python:latest

RUN apt-get update && apt-get install -y \
		curl \
		git \
        less \
        zip \
        groff \
        jq \
		&& rm -r /var/lib/apt/lists/* \
		&& curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
		&& unzip awscli-bundle.zip \
		&& ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

VOLUME /usr/local/aws

WORKDIR /usr/local/aws

CMD ["aws list"]