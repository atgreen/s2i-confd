# s2i-confd
> Build webhook-like triggers based on changes in your key/value stores.

This is an OpenShift
[s2i](https://github.com/openshift/source-to-image) builder image for
[confd](http://www.confd.io/) services.  But what does that even
mean?  confd is not a language runtime, right??

confd is a tool to automate changes in local config files based on
changing values in a key/value store, including etcd, consul, vault
and more.  The config files are generated from templates provided in
the confd config directory.  And, optionally, a service reload script
will execute whenever the config file changes.

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
`curl` to anything you like.

s2i-confd works with OpenShift's s2i tooling to produce fully-baked
confd container images based on configury store in a git repo.  See
https://github.com/atgreen/sample-confd-config as an example.

## Author

s2i-confd is an experiment by Anthony Green <green@redhat.com>.
