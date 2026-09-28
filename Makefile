.PHONY: sync check dry-run setup install update-sources update-vendored

# Fetch declarative skill sources from rulesync.jsonc at their locked refs
install:
	rulesync install

# Bump declarative sources to their latest upstream commit and update rulesync.lock
update-sources:
	rulesync install --update

sync: install
	rulesync generate -g

check:
	rulesync install --frozen
	rulesync generate -g --check

dry-run: install
	rulesync generate -g --dry-run

setup:
	chmod +x setup.sh && ./setup.sh

update-vendored:
	chmod +x scripts/update-vendored.sh && ./scripts/update-vendored.sh
