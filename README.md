# Network Tools Container

Container has standard/handy networking utilities installed.  Script contains a function to launch and exec into a pod with that container, should be added to path as a standalone file or appended to `~/.bash_profile`.

Only tested on macOS

Launch script dependencies: kubectl, jq

# Build

`docker build -t nettools:latest .`
