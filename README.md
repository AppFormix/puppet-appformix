# puppet-appformix
#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with appformix](#setup)
    * [Setup Requirements](#setup-requirements)
    * [Beginning with appformix](#beginning-with-appformix)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - Classes and parameters](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This is a puppet module for deploying and configuring AppFormix software on AppFormix controller and OpenStack compute nodes.

## Setup

### Setup Requirements

The module currently is under development and so a yum or apt repository containing the AppFormix packages must be available to the host before any classes from this module will work.

### Beginning with appformix

The software requires a controller node to be configured before the compute nodes can be configured:

~~~puppet
node 'controller.example.com' {
  class { 'appformix::controller': }
}
~~~

All compute nodes can then be configured to communicate with the controller:

~~~puppet
node /compute\d+.example.com/ {
  #...
  class { 'appformix::compute': }
}
~~~

## Usage

The software is self-configuring, so the module simply installs the packages. In the future it can also start the service.

### Install from repository
If you already have a yum or apt repository configured with the packages, see the example in [Beginning with appformix](#beginning-with-appformix).

### Install from local packages

If you would like to install the software from a local directory containing the packages, the classes must be told where the packages are located and what version you would like installed:

~~~puppet
node 'controller.example.com' {
  class { 'appformix::controller':
    source_dir => '/mount/nfs/packages',
    version    => '0.5.0',
  }
}
node /compute\d+.example.com/ {
  class { 'appformix::compute':
    source_dir => '/mount/nfs/packages',
    version    => '0.5.0',
  }
}
~~~

## Reference

### Public classes:
#### Class: `appformix::controller`
The class for installing and configuring the appformix controller software.

**Parameters:**

##### `package_ensure`
The value of `ensure` for the package resources. May be `present`, `absent`, etc. Default: `present`

##### `source_dir`
An absolute path to a directory on the agent containing the AppFormix packages. Requires `version`

##### `version`
When installing from a `source_dir`, what version of the package to install.

#### Class: `appformix::compute`
The class for installing and configuring the appformix compute manager. It has no parameters.

**Parameters:**

##### `package_ensure`
The value of `ensure` for the package resources. May be `present`, `absent`, etc. Default: `present`

##### `source_dir`
An absolute path to a directory on the agent containing the AppFormix packages. Requires `version`

##### `version`
When installing from a `source_dir`, what version of the package to install.

## Limitations

This module is currently under development and is not finished. The module cannot configure the package repository. The module cannot manage the services.

## Development

Github pull requests are welcome.
