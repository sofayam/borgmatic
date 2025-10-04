# Borgmatic construction site -> deployment 


## Components

### client

this is the borgmatic container with just a root and a config.yaml copied in.

the idea is you ssh into this and simply say "borgmatic" and the rest (backing up to
the server) happens by itself

### server

this is just a normal user on the proxmox box with access to the two hdds where the repo is stored

there are also some scripts to mount the repo and browse it

## Things to configure

### config.yaml

- source directories

each directory you want at the top level. 

The excludes should already take care of the rubbish

- server address (should stay the same)


### dockerrun.sh

- mounts for repo and source volumes (volume1 and volume2)

### ssh 

the root user on the synology will need access to the repo host

in the container do 

    ssh-keygen -t ed25519 -N "" -f /root/.ssh/id_ed25519

and then

    ssh-copy-id mark@192.168.68.114

