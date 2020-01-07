echo "Welcome to the Ansible Desktop setup script"
echo
echo
read -p 'Your username: ' USERNAME
read -p 'Your full name (for Git and account label): ' FULLNAME
read -p 'Your email address (for Git only):' EMAIL_ADDRESS
export USERNAME
export FULLNAME
export EMAIL_ADDRESS

if id "$USERNAME" &>/dev/null; then
	echo "User already exists, skipping account creation"
else
	echo "Creating account and setting a password"
	adduser "$USERNAME" -c "$FULLNAME"
	#Password is already set by adduser
	#The -c option is a comma-separated list of extra Finger properties. The first one is the Full Name, so we fill that in.
fi

echo "Setting up Ansible from PPA"
apt-add-repository ppa:ansible/ansible &>/dev/null
apt update &>/dev/null
apt install ansible
