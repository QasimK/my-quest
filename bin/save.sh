#!/bin/bash
set -euxo pipefail

REPO="$(git rev-parse --show-toplevel)"
BUILD="${REPO}/book"
BASE="$(mktemp -d -t my-quest-book.XXXXXXXXXX)"
BOOK="${BASE}/book"

# Fail-safe
function finish {
    git worktree remove --force "$BOOK" || true
    rm -rf "$BASE" || true
}
trap finish EXIT

cd "$REPO"
git add --all 'src/'
git commit -am "Update My Quest"
env GIT_ALLOW_MASTER=1 git push

mdbook clean
mdbook build

git worktree add "$BOOK" book
cd "$BOOK"

rsync -aqr "${BUILD}/" "$BOOK"
git add --all
git commit -am "Publish an update to My Quest"
git push

echo "https://qasimk.io/my-quest/"
