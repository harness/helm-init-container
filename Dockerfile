FROM redhat/ubi8-minimal:8.10

RUN yum update -y
RUN yum install curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

ADD wait_for.sh /usr/local/bin/wait_for.sh

ENTRYPOINT ["wait_for.sh"]
