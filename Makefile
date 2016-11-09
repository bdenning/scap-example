all: build resolve html datastream

validate: datastream
	oscap xccdf validate example-xccdf-ds.xml
	oscap oval validate example-xccdf-ds.xml

datastream: resolve
	oscap ds sds-compose example-xccdf.xml example-xccdf-ds.xml

fix: datastream
	oscap xccdf generate fix --profile xccdf_io.github.bdenning_profile_default \
	--template urn:xccdf:fix:script:ansible --output example-playbook.yml example-xccdf-ds.xml

html: resolve
	oscap xccdf generate guide --profile xccdf_io.github.bdenning_profile_default example-xccdf.xml > example-xccdf.html

resolve: build
	oscap xccdf resolve -o example-xccdf.xml example-xccdf.xml

build:
	python build.py

clean:
	rm -frv *~
	rm -f example-xccdf.xml
	rm -f example-xccdf-ds.xml
	rm -f example-xccdf.html
	rm -f example-playbook.yml

.phony: clean
