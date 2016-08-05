This directory contains some custom facts that are used to look up hiera data in
the hierarchy.  For now, most (all?) of these are just hard-coded to return a
single value.  This will not give us any variance in which of the hiera data files
ultimately end up being used to provide the data, because (for now at least),
we'll be running perf tests with homogenous simulated agents that will all send up
the same fact values.  However, these facts will at least allow us to force the
server to exercise the hiera code paths (and disk reads) that would happen in a
typical deployment.

In the future, if we start to put together more heterogenous scenarios that
simulate multiple different types of agents simultaneously, we could
introduce some variance into these facts to cause the server to pull data from
a broader set of the hiera data files.  Or, we could introduce some sort of
variance into the gatling simulations so that even when it is simulating homogenous
agents it is able to vary their facts slightly.
