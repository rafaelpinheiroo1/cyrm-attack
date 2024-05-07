
#!/bin/bash

docker run --name containernet -it --rm --privileged --pid='host' -v /var/run/docker.sock:/var/run/docker.sock --mount type=bind,source=$(pwd)/topology,target=/cyrm-attack containernet-cyrm python3 /cyrm-attack/corporate-attack-scenario.py








