===========
 Objective
===========

Deploy Mesosphere DC/OS onto a cluster


==============
 Requirements
==============

Python, Ansible, Boto. See `requirements.txt` for the frozen set and
`requirements-open.txt` for the open set. Use a virtualenv.


===========
 Procedure
===========

#. start a cluster (see `ec2.yaml`) having 6 nodes
#. generate the inventory file
#. run `prepare.yaml` to prepare the nodes
#. run `dcos.yaml` to deploy DCOS
#. go the the IP address of the master node and login

It may take several minutes after ansible finishes running the
playbooks before the cluster is available.
