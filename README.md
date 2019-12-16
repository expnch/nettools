# Network Tools Container

Container has standard/handy networking utilities installed.  Script contains a function to launch and exec into a pod with that container, should be added to path or dropped in `.bash_profile`/`.bash_rc`.

Only tested on macOS

Dependencies: kubectl, jq

# Build

`docker build -t expnch/nettools .`
