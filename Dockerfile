FROM redhat/ubi9-minimal:9.4

RUN echo -e '#!/bin/sh\nexec /usr/bin/microdnf -y "$@"' > /usr/local/bin/microdnf \
  && chmod +x /usr/local/bin/microdnf

RUN microdnf update --nodocs --setopt=install_weak_deps=0 \
  && microdnf install -y findutils \
  && microdnf clean all
  
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

ADD wait_for.sh /usr/local/bin/wait_for.sh

ENTRYPOINT ["wait_for.sh"]
