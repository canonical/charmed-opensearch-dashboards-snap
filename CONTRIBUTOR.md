## Developer Guide:


### Set up opensearch

We recommend to install the opensearch snap, so that opensearch-dashboards
has an opensearch instance to connect to.

Instructions to get the opensearch snap working are detailed on the OpenSearch Snap
[Github repository](https://github.com/canonical/opensearch-snap)


### Installation:
Steps to package and install `charmed-opensearch-dashboards` snap locally (having checked out this repo):

```
cd charmed-opensearch-dashboards-snap

# build and package the snap
snapcraft pack --debug

# install the snap
sudo snap install ./charmed-opensearch-dashboards_2.12.0_amd64.snap --dangerous --jailmode
```


## Start charmed-opensearch-dashboards

As explained in the 
[README: Starting Charmed OpenSearch Dashboards](https://github.com/canonical/charmed-opensearch-dashboards-snap?tab=readme-ov-file#starting-charmed-opensearch-dashboards)

### Test your installation:

As explained in the
[README: Testing the Charmed OpenSearch Dashboards setup](https://github.com/canonical/charmed-opensearch-dashboards-snap?tab=readme-ov-file#testing-the-charmed-opensearch-dashboards-setup)

### For live debugging:
1. The journal logs:
   ```
   sudo sysctl -w kernel.printk_ratelimit=0 ; journalctl --follow | grep opensearch-dashboards
   ```
2. Snap logs:
   ```
   snappy-debug scanlog --only-snap=charmed-opensearch-dashboards
   ```
