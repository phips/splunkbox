# Automating Splunk with Ansible - SUG July meet at John Lewis, London

[User Group discussion on LinkedIn](http://linkd.in/1nNMDLw)

Installs and sets running Splunk, on a CentOS install inside of [Vagrant](http://vagrantup.com).

Tested with CentOS 7 64bit and Splunk splunk-6.2.3-264376 as of November 2015.

You need to have [Ansible](http://ansible.com) installed prior to spinning this box up.

Look at [site.yml](http://github.com/phips/splunkbox/blob/jldemo/site.yml) to see what Ansible is doing to the base CentOS install.

You'll need to download the Splunk RPM and put it in the files/ directory off of the [roles/splunk](http://github.com/phips/splunkbox/blob/jldemo/roles/splunk) directory. 

If you install any apps (look at [host_vars/head.yml](http://github.com/phips/splunkbox/blob/jldemo/host_vars/head.yml) for examples) you'll also want to down them first, and pop the tgz files in the same directory.
