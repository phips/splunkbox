# CentOS 6 Vagrant Box with Splunk install

Installs and sets running Splunk, on top of a [@core CentOS6 Vagrant
Box](http://vntx-box.s3.amazonaws.com/centos6.box).

Look at
[bootstrap.pp](http://github.com/phips/splunkbox/blob/master/puppet/manifests/bootstrap.pp)
to see what Puppet is doing to the base CentOS6
[box](http://docs.vagrantup.com/v2/virtualbox/boxes.html).

You'll need to download the Splunk RPM and put it in a sw/ directory off of
wherever you clone this to. Check it's the same version as mentioned in
[bootstrap.pp](http://github.com/phips/splunkbox/blob/master/puppet/manifests/bootstrap.pp)
and adjust the filename accordingly if it's not.

The VM will boot, install Puppet, then install Splunk and set it running. You
can browse to http://localhost:8000 on your host machine to log in.
