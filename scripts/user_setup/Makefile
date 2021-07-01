.PHONY: all
all: basic

.PHONY: basic
basic:
	ansible-playbook main.yml -t cli --skip-tags pro

.PHONY: basic_local
basic_local:
	ansible-playbook main.yml -c local -i local_inventory --become -t cli --skip-tags pro

.PHONY: play
play:
	ansible-playbook main.yml

.PHONY: play_%
play_%:
	ansible-playbook main.yml -t $*

.PHONY: local
local:
	ansible-playbook main.yml -c local -i local_inventory --become

.PHONY: local_%
local_%:
	ansible-playbook main.yml -c local -i local_inventory --become -t $*
