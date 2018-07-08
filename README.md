# System Setup
You should have docker installed, and for wide port ranges, you will need

	# --userland-proxy=false

Added to the ExecStart of dockerd in the docker service file.

# Building & Running

The username and password used for logging into the resulting container is set in start.sh

Copy the sources to your docker host and build the container:

	# docker build --rm -t veeam/ssh:centos7 .

To run:

	# docker run -v /mnt/raid10:/mnt -d -p 2222:22 -p 2500-5000:2500-5000 veeam/ssh:centos7

To test:

	# ssh -p 2222 user@localhost

