FROM apsl/gcloud

RUN apt-get -qq update && \
  apt-get install -yq --no-install-recommends curl && \
  rm -rf /var/lib/apt/lists/*

RUN curl -fSLk 'https://bootstrap.pypa.io/get-pip.py' | python
RUN pip install sh

COPY GCE-Disk-Snapshot/gce-disk-snapshot.py /

COPY docker-entrypoint.sh /

# latest code edition forces the path on /usr/local/bin
RUN ln -s /google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["backup"]
