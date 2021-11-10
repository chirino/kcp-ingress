#/bin/bash

# localdev.sh overrides the go.mod file with a set of relative directories
# so you can develop with a local version of Kubernetes for quick iteration.
# To do this you must check out k/k from kcp-dev/kubernetes from the
# feature-logical-clusters branch locally and have it be in the expected
# GOPATH location (../../../k8s.io/kubernetes).
#
# This script should eventually be paired with vendoring scripts for
# maintaining the set of repos and coordinating bumps.

set -o errexit
set -o nounset
set -o pipefail

OS_ROOT="$(dirname "${BASH_SOURCE}")/../.."

sed -i -e 's:=>  *github\.com/kcp-dev/\(kubernetes[^ ]*\) ..*:=> ../\1:' "${OS_ROOT}/go.mod"
