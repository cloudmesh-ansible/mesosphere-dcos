===========
 About
===========

This repository provides Ansible playbook to deploy a Mesosphere DC/OS
cluster.  Developed and tested against CentOS 7 nodes running on EC2
following the `Advanced Installation Guide
<https://dcos.io/docs/1.9/installing/custom/advanced/>`_.


==============
 Requirements
==============

Python, Ansible, Boto, awscli. See `<requirements.txt>`_ for the frozen set and
`<requirements-open.txt>`_ for the open set. Use a virtualenv.


===========
 Procedure
===========

#. start a cluster (see `<ec2.yaml>`_) having 6 nodes
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
