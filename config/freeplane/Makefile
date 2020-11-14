VERSION ?= 1.8.x
PLATFORM ?= mac

.PHONY: all
all:

.PHONY: linux
linux:
	ln -sf $(shell pwd)/$(VERSION)/linux/accelerator.properties ~/.config/freeplane/$(VERSION)/accelerator.properties
	ln -sf $(shell pwd)/$(VERSION)/linux/freeplaneoptions ~/.config/freeplane/$(VERSION)/freeplaneoptions
	ln -sf $(shell pwd)/$(VERSION)/mytemplates.mm ~/.config/freeplane/$(VERSION)/templates/mytemplates.mm

.PHONY: mac
	ln -sf $(shell pwd)/$(VERSION)/mac/accelerator.properties ~/.freeplane/$(VERSION)/accelerator.properties
	ln -sf $(shell pwd)/$(VERSION)/mac/freeplaneoptions ~/.freeplane/$(VERSION)/freeplaneoptions
	ln -sf $(shell pwd)/$(VERSION)/mytemplates.mm ~/.freeplane/$(VERSION)/templates/mytemplates.mm
