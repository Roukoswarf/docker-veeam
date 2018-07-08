#!/bin/bash
SSH_USERNAME='backup'
SSH_USERPASS='password'
__create_user() {
# Create a user to SSH into as.
useradd $SSH_USERNAME
usermod -aG wheel $SSH_USERNAME
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin backup)
echo ssh user password: $SSH_USERPASS
}

# Call all functions
__create_user
