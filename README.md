= s2i-confd

This is an OpenShift s2i builder image for `confd` services.  But what
does that even mean?  `confd` is not a language runtime, right??

`confd` is a tool to automate changes in local config files based on
changing values in a key/value store, including etcd, consul and
vault.  The config files are generated from templates provided in the
`confd` config directory.  And, optionally, a service reload script
will execute whenever the config file changes.

What if, instead of creating config files from templates, we created
shell scripts?  And what if, instead of triggering reloads of those
scripts, we executed them?  And what if those scripts were simple
`curl` commands used to trigger automation in Ansible Tower / AWX?

What we end up with is a very simple system to trigger the execution
of Ansible job templates based on changes in a key/value store.

Possible use cases include:

- automate DNS changes based on IPs stored in etcd (dynamic DNS)

- automate the rotation of credentials based on changes in vault

- etc etc


