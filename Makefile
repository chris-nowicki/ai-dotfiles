.PHONY: sync check dry-run setup

sync:
	rulesync generate -g

check:
	rulesync generate -g --check

dry-run:
	rulesync generate -g --dry-run

setup:
	chmod +x setup.sh && ./setup.sh
