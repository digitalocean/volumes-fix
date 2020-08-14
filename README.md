In order to fix incorrectly initialized volumes, perform the following steps:

1. Create a new temporary droplet using RancherOS v1.5.6 image (it's under "Container distributions" tab)
   in the same region where the volume is located
2. Log into the droplet as user rancher: `ssh rancher@droplet-ip`
3. From the Cloud UI attach volume[s] to this new temporary droplet
4. Download and run the script: `wget -O - https://raw.githubusercontent.com/digitalocean/volumes-fix/master/fix-volumes.sh | sudo bash`
5. Detach volume[s] from the droplet using Cloud UI
