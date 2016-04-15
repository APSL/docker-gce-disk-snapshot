#!/bin/sh

gcloud auth activate-service-account $GCLOUD_EMAIL_SERVICE_ACCOUNT --key-file /keys/$GCLOUD_KEY_FILE
gcloud config set project $GCLOUD_PROJECT 

if [ "$1" = 'backup' ]; then
    exec python gce-disk-snapshot.py -d $SNAPSHOT_DISK -z $SNAPSHOT_ZONE -s /status -H $SNAPSHOT_RETENTION
fi

exec "$@"