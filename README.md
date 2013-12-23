# CentOS 6 Vagrant Box with Splunk install via Ansible

Installs and sets running Splunk, on top of a [@core CentOS6 Vagrant
Box](http://vntx.cc/boxes/centos65.box).

Tested with CentOS 6.4 64bit and Splunk 6.0-182037 on Nov 3rd 2013.

You need to have [Ansible](http://ansibleworks.com) installed prior to 
spinning this box up.

Look at
[playbook.yaml](http://github.com/phips/splunkbox/blob/master/playbook.yaml)
to see what Ansible is doing to the base CentOS6
[box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

You'll need to download the Splunk RPM and put it in a sw/ directory off of
wherever you clone this to. Check it's the same version as mentioned in
[playbook.yaml](http://github.com/phips/splunkbox/blob/master/playbook.yaml)
and adjust the filename accordingly if it's not.

The VM will boot and install Splunk and set it running. You
can browse to http://localhost:8000 on your host machine to log in.
