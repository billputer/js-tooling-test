# js-tooling-test

Playground to test out Node, Neo4j, and Ansible.

## Setup

```
vagrant up
vagrant provision
vagrant ssh -c '/srv/js-tooling-test/node_modules/coffee-script/bin/coffee /srv/js-tooling-test/create-data.coffee'
```

This will install Node and Neo4j on the VM, and run a *very* simple Node.js app at http://localhost:8000/.
