#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
OUTDIR="${1:-$DIR/build}"
SOURCEDIR="${2:-$OUTDIR/..}"

echo "OUTDIR = $OUTDIR"
echo "SOURCEDIR = $SOURCEDIR"

mkdir -p $OUTDIR

# Convert line endings for live-server executable
echo "Converting line endings for live-server.js"
dos2unix node_modules/live-server/live-server.js

cd ./_dprhtml
chmod +x ./build.sh
./build.sh $OUTDIR $SOURCEDIR
cd ..

echo "Contents of OUTDIR [$OUTDIR]"
ls -laF $OUTDIR
