.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' \
		| sed -e 's/\[32m##/[33m/'

## Host

.PHONY: run
run: ## Run dotfiles in isolated virtual machine
	vagrant up 2>&1 \
		| awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $$0; fflush(); }' \
		| tee ./logs/log_`date +%s`.log

.PHONY: clean
clean: ## Tear down dotfiles virtual machine
	vagrant destroy --force
