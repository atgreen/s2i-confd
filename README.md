# s2i-confd
> Build webhook-like triggers based on changes in your key/value stores.

This is an OpenShift
[s2i](https://github.com/openshift/source-to-image) builder image for
[confd](http://www.confd.io/) services.  But what does that even
mean?  confd is not a language runtime, right??

confd watches key/value stores for changes and updates local config
files based on a templating scheme.  Supported key/value stores
include [etcd](https://coreos.com/etcd/),
[consul](https://www.consul.io/),
[vault](https://www.vaultproject.io/) and more.  When a change is
detected and a new config file is generated, confd will optionally run
a service reload script to force the adoption of the new config by the
appropriate service.

What if the "config" files we generate are actually shell scripts?
And what if, instead of triggering reloads of those config files, we
executed these shell scripts?  And what if those scripts were simple
`curl` commands used to trigger automation in something like [Ansible
Tower](https://www.ansible.com/products/tower) /
[AWX](https://github.com/ansible/awx)?

What we'd end up with is a very simple system to trigger the execution
of Ansible job templates based on changes in a key/value store.  Think
of it like a webhook service for key/value stores.

Possible use cases include:

- automate DNS changes based on IP changes in etcd (dynamic DNS)

- automate the rotation of credentials stored elsewhere based on
  changes in vault

- etc etc

Tower is just used here as an example.  It's your shell script, so
`curl` to anything you like.  Use it, for instance, to post slack
messages on changes in Hashicorp Vault.

s2i-confd works with OpenShift's source-to-image (s2i) tooling to
produce fully-baked confd container images based on configury stored
in a git repo.  The confd config files are the "source", and a
purpose-built confd service container is the "image".  See
https://github.com/atgreen/sample-confd-config as an example.

## Sample usage

The s2i-confd container image can be found in docker hub at
https://cloud.docker.com/repository/docker/atgreen/s2i-confd .

Most users will want to use OpenShift BuildConfigs with git webhooks
to trigger the s2i build.  However, you can also run s2i by hand like
so:

    $ s2i build https://github.com/atgreen/sample-confd-config.git atgreen/s2i-confd dyndns-trigger
    
This uses the `atgreen/s2i-confd` builder image against the confd
configury stored at https://github.com/atgreen/sample-confd-config.git
resulting in docker image called `dyndns-trigger`.

## Author

s2i-confd is an experiment by Anthony Green <green@redhat.com>.
