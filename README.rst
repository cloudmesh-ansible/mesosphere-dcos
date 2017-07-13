===========
 About
===========

This repository provides Ansible playbook to deploy a Mesosphere DC/OS
cluster.  Developed and tested against CentOS 7 nodes running on EC2
following the `Advanced Installation Guide
<https://dcos.io/docs/1.9/installing/custom/advanced/>`_.

The basic approach:

- setup a bootstrap node with an initial configuration describing the mesos cluster.
- the mesos master, public agent, and private agents are installed using the configuration from the bootstrap node.
- access the cluster in a web browser (ip address of master on port 80) to login (using google account)

The bootstrap node is **not** part of the cluster.

Nodes are grouped as bootstrap, master, public or private agent in the
Ansible inventory file.


After the DCOS is deployed you can install packages from the
"Universe" tab. I was able to successfully *deploy* (but haven't used)
the following

- chronos
- hdfs
- marathon
- spark


I've tested with the following number of nodes (including bootstrap)

- 6
- 16


==============
 Requirements
==============

Python, Ansible, Boto, awscli. See `<requirements.txt>`_ for the frozen set and
`<requirements-open.txt>`_ for the open set. Use a virtualenv.


===========
 Procedure
===========

#. start a cluster (see `<ec2.yaml>`_) having 6 nodes

   Note: this is hacked to work on my environment. You'll likely need
   to change the parameters to the ec2 module.

#. generate the inventory file

   Set ``ansible_ssh_host`` in each
   of the host files ``host_vars/mesos-0.yaml``,
   ``host_vars/mesos-1.yaml``, etc.

   You can use the `<mk-inventory>`_

#. run `<prepare.yaml>`_ to prepare the nodes
#. run `<dcos.yaml>`_ to deploy DCOS
#. go the the IP address of the master node and login

It may take several minutes after ansible finishes running the
playbooks before the cluster is available.
