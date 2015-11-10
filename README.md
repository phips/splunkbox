# CentOS 6 Vagrant Box with Splunk install via Ansible

Installs and sets running Splunk, on top of a [@core CentOS Vagrant Box](http://vntx.cc/boxes/centos65.box).

Tested with CentOS 7 64bit and Splunk 6.2.3-264376 as of November 2015.

You need to have [Ansible](http://ansible.com) installed prior to spinning this box up.

Look at [playbook.yml](http://github.com/phips/splunkbox/blob/master/playbook.yml) to see what Ansible is doing to the base CentOS [box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

You'll need to download the Splunk RPM and put it in a sw/ directory off of wherever you clone this to. Check it's the same version as mentioned in [playbook.yml](http://github.com/phips/splunkbox/blob/master/playbook.yml) and adjust the filename accordingly if it's not.

The VM will boot and install Splunk and set it running on localhost. It will also install nginx from [EPEL](https://fedoraproject.org/wiki/EPEL), set it listening on port 80, and proxy to Splunk. There are notes in the [splunk.conf](http://github.com/phips/splunkbox/blob/master/templates/splunk.conf.j2) file about how to listen on https, and how to use basic authentication.

There are also a number of Splunk '[must have](http://wiki.splunk.com/Things_I_wish_I_knew_then)' apps that are installed. You'll need to download these from [apps.splunk.com]() first - all the URLs are noted in [the playbook](http://github.com/phips/splunkbox/blob/master/playbook.yml). If you want to skip them, just set installapps to false (with [extra-vars](http://docs.ansible.com/playbooks_variables.html#passing-variables-on-the-command-line) - see the [Vagrantfile](http://github.com/phips/splunkbox/blob/master/Vagrantfile)).
