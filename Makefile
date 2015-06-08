SHELL          := /bin/bash
PREFIX         :=
TO_DIR         := /usr/local

BIN_DIR        := $(PREFIX)/usr/sbin
LIVE_FILES_DIR := $(PREFIX)$(TO_DIR)/share/live-files
DIRS           := $(BIN_DIR) $(LIVE_FILES_DIR)
CP             := cp --preserve=mode -P
BIN_FILES      := $(shell find bin -xtype f -executable)
RBIN_FILES     := $(shell find bin -type f -executable)

.PHONY: help install

help:
	@echo "make help       show this help"

install: $(EXCLUDE_ORIG) | $(DIRS)
	$(CP) $(BIN_FILES) $(BIN_DIR)/
	$(CP) -r live-files/* $(LIVE_FILES_DIR)

$(DIRS):
	mkdir -p $@
