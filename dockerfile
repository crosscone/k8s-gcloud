FROM google/cloud-sdk:latest

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh \
 && chmod 700 get_helm.sh \
 && ./get_helm.sh \
 && rm get_helm.sh

COPY configure /bin/configure
RUN chmod +x /bin/configure

ENTRYPOINT []