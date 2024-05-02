export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := "YES"

service := "invidious"

# Load .env file
set dotenv-load

help:
  just -l

# install ansible dependencies
install:
    ansible-galaxy install -r collections/requirements.yml -f

# deployment
deploy:
  ansible-playbook deploy.yaml

# get latest releae version
version:
  ansible-playbook latest-version.yaml

# start the service
start:
  ansible all -m systemd -a "name={{service}} state=started scope=user" -u {{service}} 1>/dev/null

# stop the service
stop:
  ansible all -m systemd -a "name={{service}} state=stopped scope=user" -u {{service}} 1>/dev/null

# restart the service
restart:
  ansible all -m systemd -a "name={{service}} state=restarted scope=user" -u {{service}} 1>/dev/null

# ssh into the server
ssh:
  ssh -p23 {{service}}@//
