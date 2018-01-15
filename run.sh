#!/bin/bash

# run.sh

# --
# Run on email dataset (3 seconds)

mkdir -p _results/email

# METIS input + verify answers
./hhl -o ./_results/email/email.order -l ./_results/email/email.labels ./_data/email/email.graph
./lcheck -c -l ./_results/email/email.labels ./_data/email/email.graph

# Edgelist input
./hhl -o ./_results/email/email.order -l ./_results/email/email.labels ./_data/email/email.edgelist
./lcheck -c -l ./_results/email/email.labels ./_data/email/email.edgelist


# --
# Run on coAuthorsCiteseer dataset (200k vertices, 20 minutes)
# !! See README.orig for a little explanation about eg `akiba` vs `hhl`

mkdir -p {_data,_results}/coAuthorsCiteseer

wget https://www.cc.gatech.edu/dimacs10/archive/data/coauthor/coAuthorsCiteseer.graph.bz2
bunzip2 coAuthorsCiteseer.graph.bz2
mv coAuthorsCiteseer.graph _data/coAuthorsCiteseer

./degree -o ./_results/coAuthorsCiteseer/coAuthorsCiteseer.order ./_data/coAuthorsCiteseer/coAuthorsCiteseer.graph
./akiba -o ./_results/coAuthorsCiteseer/coAuthorsCiteseer.order \
    -l ./_results/coAuthorsCiteseer/coAuthorsCiteseer.labels \
    ./_data/coAuthorsCiteseer/coAuthorsCiteseer.graph


# --
# Run on larger datasets

# This is a generic algorithm, so can be run on any of the available datasets
# 
# However, we will likely be adding documentation about particularly relevant
# in the near future.