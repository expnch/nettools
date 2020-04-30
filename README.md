# Network Tools Container

This is a container with standard/handy networking utilities installed.

The launc script `kube-run.sh` contains a Bash function to launch and exec into a pod on Kubernetes running the container. It should be added to path as a standalone file or its contents appended to `~/.bash_profile`.

Only tested on macOS.

Launch script dependencies: `kubectl`, `jq`

# Build

`docker build -t nettools:latest .`
