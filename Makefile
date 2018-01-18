.DEFAULT_GOAL := short

self    := $(lastword $(MAKEFILE_LIST))
$(self) := $(basename $(self))
$(self):;

# get various ansible versions

base := $(or $(GIT_CLONE_BASE), ./ansible)
versions := stable-2.3 stable-2.4 devel

stables  := 1.9 2.0 2.1 2.2 2.3 2.4
all-versions := $(stables:%=stable-%) devel

url := git://github.com/ansible/ansible.git

clone = (cd $(base); git clone --branch $(version) --recursive $(url) ansible-$(version))
pull  = (cd $(base)/ansible-$(version); git pull --rebase; git submodule update --init --recursive)
setup = source $(base)/ansible-$(version)/hacking/env-setup -q
pkgs  = sudo aptitude install python-jinja2 python-netaddr
emacs  = (progn
emacs +=   (setenv "ANSIBLE_HOME" (expand-file-name "$(base)/ansible-$(version)"))
emacs +=   (setenv "PYTHONPATH" (expand-file-name "$(base)/ansible-$(version)/lib"))
emacs +=   (setenv "PATH" (concat (expand-file-name "$(base)/ansible-$(version)/bin:") (getenv "PATH"))))

once:; mkdir -p ansible log roles tmp
req:; ansible-galaxy install -i -r requirements.yml

short:
	@$(foreach version,$(versions),echo '$(pull)';)
	@$(foreach version,$(versions),echo '$(setup)';)

long:
	@$(foreach version,$(all-versions),echo '$(clone)';)
	@echo
	@$(foreach version,$(all-versions),echo '$(pull)';)
	@echo
	@$(foreach version,$(all-versions),echo '$(setup)';)

emacs:; @$(foreach version,$(all-versions),echo '$(strip $(emacs))';)

clone pull setup:; @echo '$($@)'

.PHONY: once req short long emacs clone pull setup
