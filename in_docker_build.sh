# Note: this script is ran IN DOCKER, do not run it directly, run build-dos or build-win32 instead

set -ex
cd /project/jSH
make NOTCP=1 -f $*
