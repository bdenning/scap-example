all: html datastream

datastream: resolve
	oscap ds sds-compose example-xccdf.xml example-xccdf-ds.xml

html: resolve
	oscap xccdf generate guide --profile xccdf_io.github.bdenning_profile_default example-xccdf.xml > example-xccdf.html

resolve: build
	oscap xccdf resolve -o example-xccdf.xml example-xccdf.xml

build:	build
	mkdir build
	python build.py

clean:
	rm -frv *~
	rm -f example-xccdf-ds.xml
	rm -f example-xccdf.html

.phony: clean
