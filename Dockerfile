FROM openshift/base-centos7

MAINTAINER Anthony Green <green@redhat.com>

LABEL io.k8s.description="Platform for building confd services" \
      io.k8s.display-name="confd" \
      io.openshift.tags="builder,confd"

RUN wget https://raw.githubusercontent.com/kelseyhightower/confd/master/LICENSE \
    && mv LICENSE LICENSE-confd \
    && wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 \
    && mv confd* confd \
    && chmod +x ./confd

COPY ./s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

USER 1001

CMD ["/usr/libexec/s2i/usage"]
