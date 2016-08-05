# puppetlabs-puppetserver_perf_control
An r10k control repo for Puppet Server (and PE) perf testing and memory analysis

## What is this repo?

This repo is an r10k control repo that we will be using to generate catalogs for
automated gatling performance testing, as well as for other memory analysis and
performance testing work.

## ~branching strategy

The `production` branch of this repo should be thought of as the mainline/HEAD for
development, and it should be assumed that it is subject to change at any time.

Therefore, for any kind of perf or memory test that we expect to be repeatable, we
should create a branch off of production at a specific point in time, and treat
these branches as immutable going forward.  Recommended branch naming convention is:

    <YYYYMMDD>_<description>

So, for example,

    20160614_memtest

At some point we may need to re-evaluate this strategy if we start piling up a huge
number of these branches, but for now this seems like the best plan to ensure that
we have a fixed reference point for reliable, repeatable test outcomes.

## How to use this repo during development

This workflow assumes that you will be running puppetserver from source on your
local machine.  Further, it assumes that after cloning this control repo,
on the branch you're working on, you've created an environment-specific
`manifests/site.pp` file, which contains a `node 'default'` block that brings in
the role that you are interested in.  With this pattern, any node that is using
the specified environment is going to get that role as its classification, but
presumably the only nodes that will be using the environment are nodes where this
behavior is desirable.  We may want to look into a more sophisticated way to handle
classification in the future.

Steps:

* Create a local `r10k.yaml` config file that looks something like this:

```
:cachedir: '/my/scratch/dir/perf-control-repo/cache'

:sources:
  :puppetserver-perf:
    remote: 'git@github.com:puppetlabs/puppetlabs-puppetserver_perf_control'
    basedir: '/my/puppetserver/src/dir/target/master-code-dir/environments'
```

* Install r10k as a gem
* Make any desired changes to your local copy of the control repo, commit them, and push them up to the hubz.
* To deploy the r10k environment to your local Puppet Server, run something like `r10k deploy environment 20160614_memtest -p -v debug -c /my/scratch/dir/perf-control-repo/r10k.yaml`.  (You can leave out the environment name if you want to deploy all environments.)
* Copy the hiera.yaml file from `./root_files` into your confdir (presumably `target/master-conf-dir`), and set the `datadir` to a value appropriate for your setup (e.g. `/path/to/puppet/server/sourcecode/target/master-code-dir/environments/%{environment}/hieradata`.  (NOTE: there is a slightly confusing comment in the `hiera.yaml` file, which is copy/pasted from the actual default `hiera.yaml` that we ship.  It tells you that you might not need to set your `datadir`.  For dev, you almost always will need to set it, so just ignore the comment.)
* Spin up a vmpooler VM to use as a test agent; install puppet-agent, configure the `server` to point to your host, and then run `puppet agent -t --environment 20160614_memtest`
* Lather, rinse, repeat

