#!/bin/bash

set -e

sed -i '/[[:print:]]*DDPBATCH[[:print:]]*/d' ~/.bashrc
(
    echo
    echo "export DDPBATCH='$(pwd)/bin'"
    echo 'export PATH="$DDPBATCH:$PATH"'
) >> ~/.bashrc
source ~/.bashrc

exit 0
