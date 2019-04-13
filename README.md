# openstack-docs-downloader
Download docs of OpenStack services and projects for offline use.

## Prerequisites
1. wget
2. parallel

## Edit docs list

The services and projects of OpenStack are listed in the files located in folder `openstack-projects`. Edit the files to add/remove project docs to be downloaded.

## Edit the script

Edit file `openstack-docs-downloader.sh`, in which:

1. put the projects listed file you care in `FILES`;
2. put the Openstack release you care in `VERSIONS`;
3. [optional] modify `NUM_THREADS` for the number of wget instances in parallel.

## Run

```
./openstack-docs-downloader.sh
```

## Result

Check the docs in local folder `docs.openstack.org/`.