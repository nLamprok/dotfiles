#!/usr/bin/env bash
#
# Report drift between this Mac and the Brewfile. Changes nothing.
#
# The Brewfile is curated by hand (ordering, mas apps, deliberate omissions), so never regenerate it with `brew bundle dump -f`. Add or remove
# lines manually based on this report.
#
# Never run `brew bundle cleanup --force`: it uninstalls everything not in the
# Brewfile, including apps installed outside it on purpose.

set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> In Brewfile but not installed"
missing="$(brew bundle check --verbose --no-upgrade 2>&1 | grep '^→')"
echo "${missing:-    nothing}"

echo
echo "==> Installed but not in Brewfile"
extra="$(brew bundle cleanup 2>&1 | sed -n '/^Would uninstall/,/^Would `brew cleanup`/p' | grep -v '^Would `brew cleanup`')"
echo "${extra:-    nothing}"
