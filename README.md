#Puppet Blueprint: Sonatype Nexus

##Description

Sets up Sonatype Nexus.

##Requirements

* Puppet 3.x
* A Linux host or guest environment
* Vagrant 1.2 or higher (if using Vagrant)
* Git (if checking out the source from GitHub)

##Usage

See the Quick Start below to get started.

###Modules

See `Puppetfile` and `Puppetfile.lock` for details on their upstream sources.

##Quick Start

###VirtualBox with Vagrant

####Install VirtualBox

Follow the VirtualBox (or your OS/distribution) documentation to install VirtualBox if not already installed, see https://www.virtualbox.org/wiki/Documentation

####Install Vagrant

Follow the Vagrant (or your OS/distribution) documentation to install Vagrant (latest version recommended), see http://docs.vagrantup.com/v2/installation/index.html

####Install Librarian for Puppet

	$ gem install librarian-puppet --no-rdoc --no-ri

####Clone the Nexus Puppet Blueprint

	$ git clone https://github.com/puppet-blueprints/nexus.git

Or alternatively, download and extract the zip https://github.com/puppet-blueprints/nexus/archive/master.zip

####Fetch the cookbooks with Librarian

	$ librarian-puppet install
  
####Setup a Vagrantfile

Copy the default Vagrantfile from `share/vagrant`:

	$ cp -v share/vagrant/Vagrantfile.default Vagrantfile

####Run with Vagrant

Already up'd a skel?

	#vagrant status                   # check vm status
	#vagrant reload                   # reload the vm
	#vagrant provision                # (re-)provision the vm
	#vagrant suspend                  # suspend the vm
	#vagrant halt                     # power down the vm
	#vagrant destroy                  # destroy the vm
	#vagrant box remove skel          # remove the box

#####Run the virtual machine

Add a new box and up it (default in `Vagrantfile` is Debian 7.10, Ubuntu 12.04 is also tested and supported).

Vagrant will automatically add a new box per the Vagrantfile if not already created (including download).

	$ vagrant up

Need debug?

	$ VAGRANT_LOG=debug vagrant up
	
This uses the `Vagrantfile` and `node.json` (for the Chef Solo provisioning) residing in the root of the repository, copied above.

###RightScale

TODO

##Using Librarian

###Updating cookbooks

TODO

##Errata

TODO: MANIFEST file.

##License and Author

Author:: Chris Fordham (<chris [at] fordham [hyphon] nagy [dot] id [dot] au>)

Copyright 2013, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
