#!/usr/bin/make 
# install an uninstall that beast 

# variables to be set externally
DESTDIR= 
PREFIX=/usr/local
MODULESDIR=share/bim/modules
LIBDIR=share/bim/modules

# variables used by make 
TARGETS=$(addprefix $(DESTDIR)$(PREFIX)/$(LIBDIR)/,$(wildcard lib/*/*.bim)) $(addprefix $(DESTDIR)$(PREFIX)/$(MODULESDIR)/,$(wildcard modules/*/*.bim)) $(addprefix $(DESTDIR)$(PREFIX)/bin/,bim)
DEPS=bash

all:
	@echo usage:
	@echo make install
	@echo make PREFIX=~ MODULESDIR=.bim/modules install
	@echo make DESTDIR=/tmp/urpackagebase install
	@echo make uninstall
	@echo make clean

.checkdeps: $(addprefix .which-,$(DEPS))
	@echo testing /bin/bash
	@which /bin/bash
	@echo -------------------
	@touch $@

.which-%:
	@echo testing depency
	@which $(patsubst .which-%,%,$@)
	@echo -------------------
	@touch $@

clean:
	rm -f .checkdeps install $(addprefix .which-,$(DEPS))

install: .checkdeps $(TARGETS)
	@touch install
	@echo done

uninstall:  $(TARGETS) 
	rm -f $^
	rm -f install
	@echo done

$(DESTDIR)$(PREFIX)/$(LIBDIR)/%.bim: %.bim
	install -d $(DESTDIR)$(PREFIX)/$(LIBDIR)
	#shellcheck $<
	install $< $@

$(DESTDIR)$(PREFIX)/$(MODULESDIR)/%.bim: %.bim
	install -d $(DESTDIR)$(PREFIX)/$(MODULESDIR)
	#shellcheck $<
	install $< $@

$(DESTDIR)$(PREFIX)/bin/bim: bim
	install -d $(DESTDIR)$(PREFIX)/bin
	#shellcheck -x $<
	install $< $@

