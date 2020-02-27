FROM amazonlinux:2

WORKDIR /usr/local/bin
RUN yum install wget unzip -y
ADD https://releases.hashicorp.com/consul-aws/0.1.1/consul-aws_0.1.1_linux_amd64.zip .
RUN unzip consul-aws_0.1.1_linux_amd64.zip

ENTRYPOINT ["consul-aws", "sync-catalog", "-http-addr=http://3.235.15.229:8500", "-aws-namespace-id", "ns-fjmsnikh7zrvm3ie", "-to-consul", "-to-aws"]