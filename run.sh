#!/bin/bash

# run.sh


# --
# Installation

make all -j12

# --
# Run on email dataset (3 seconds)

mkdir -p {_data,_results}/email

time ./hhl -o _results/email/email.order -l _results/email/email.labels _data/email/email.graph

# --
# Run on coAuthorsCiteseer dataset (20 minutes)

mkdir -p {_data,_results}/coAuthorsCiteseer

wget https://www.cc.gatech.edu/dimacs10/archive/data/coauthor/coAuthorsCiteseer.graph.bz2
bunzip2 coAuthorsCiteseer.graph.bz2
mv coAuthorsCiteseer.graph _data/coAuthorsCiteseer

./degree -o _results/coAuthorsCiteseer/coAuthorsCiteseer.order _data/coAuthorsCiteseer/coAuthorsCiteseer.graph
./akiba -o _results/coAuthorsCiteseer/coAuthorsCiteseer.order _data/coAuthorsCiteseer/coAuthorsCiteseer.graph
