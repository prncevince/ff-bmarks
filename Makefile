.PHONY: all

BREWPREFIX = $(shell brew --prefix)

P = $(HOME)/Library/Application\ Support/Firefox/Profiles
D = $(filter %.default,$(shell ls -t $(P)))
B = $(firstword $(shell ls -t $(P)/$(D)/bookmarkbackups))

all: bookmarks.json 

bookmarks.json: bookmarks.jsonlz4
	python decompress.py $? $@

bookmarks.jsonlz4: $(P)/$(D)/bookmarkbackups/$(B)
	$(BREWPREFIX)/bin/gcp -pu $(P)/$(D)/bookmarkbackups/$(B) bookmarks.jsonlz4

$(P)/$(D)/bookmarkbackups/$(B): ;
