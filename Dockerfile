FROM sethvargo/hashicorp-installer AS installer
LABEL maintainer="Ramesh Godishela"
RUN /install-hashicorp-tool "vault" "1.5.0"

FROM amazon/aws-cli:latest

RUN yum install -y build-essential curl jq vim ca-certificates && \
  yum clean all

ENV LANG=en_US.UTF-8

COPY --from=installer /software/vault /vault