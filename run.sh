#!/usr/bin/env bash
set -euo pipefail

usage() {
	echo "Usage: ./run.sh [pull|push \"commit message\"]"
	exit 1
}

[ $# -ge 1 ] || usage

case "$1" in
	pull)
		git pull
		;;
	push)
		msg="${2:-Update}"
		git add -A
		git commit -m "$msg" || echo "Nothing to commit."
		git pull --rebase
		git push
		;;
	*)
		usage
		;;
esac
