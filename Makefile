PREFIX	:= /usr
SRCDIR	:= $(PREFIX)/share/zipper

define setup
	mkdir -p $(SRCDIR)/lib
	install -m 666 lib/*.sh $(SRCDIR)/lib
	install -m 755 lazyload.sh $(SRCDIR)
	install -m 755 src/zipper.sh $(PREFIX)/bin/zipper
endef

define remove
	rm -r $(SRCDIR) $(PREFIX)/bin/zipper
endef

install:
	@$(setup)
	@echo "installed."

uninstall:
	@$(remove)
	@echo "uninstalled."

reinstall:
	@$(remove)
	@$(setup)
	@echo "reinstalled."

.PHONY: install, uninstall, reinstall