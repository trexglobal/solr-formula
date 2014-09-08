Solr server install SaltStack Formula
=============

Installing Solr server

## What it does

1. Install Solr with tomcat6
2. Setup Solr

## Install

1. Add remotes to /etc/salt/master

  ```yaml
  gitfs_remotes:
    - git://github.com/trexglobal/solr-formula
  ```
2. Setup [pillar](http://docs.saltstack.com/en/latest/topics/pillar/) from pillar.example
3. Add basic to your server [state file](http://docs.saltstack.com/en/latest/topics/tutorials/starting_states.html)

  ```yaml
  include:
      - solr
  ```

  or to the [top.sls](http://docs.saltstack.com/en/latest/ref/states/top.html) file
  

  ```yaml
  base:
    'some.server.example.com':
      - solr
  ```
