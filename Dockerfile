FROM harness0.harness.io/oci/docker_artifacts/hhi/harnessos-ubi:1

RUN apk add --no-cache jq kubectl-1.37-default

COPY --chmod=755 wait_for.sh /usr/local/bin/wait_for.sh

USER 65534

ENTRYPOINT ["wait_for.sh"]
