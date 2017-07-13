#!/bin/bash

install_ansible_galaxy_roles()
{
  IS_INSTALLED=$(which ansible-galaxy > /dev/null; echo $?)
  ANSIBLE_PATH=`dirname $0`/ansible

  if [[ "$IS_INSTALLED" -ge 1 ]]; then
    echo "Ansible Galaxy is not installed."
    exit "$IS_INSTALLED"
  fi

  ansible-galaxy install -r "$ANSIBLE_PATH/requirements.yml" -p "$ANSIBLE_PATH/vendor"

  exit
}

install_ansible_galaxy_roles
