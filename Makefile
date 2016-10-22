all:	validate html

eval:
	oscap xccdf eval --profile xccdf_io.github.bdenning_profile_default --cpe fedora-cpe.xml security-baseline.xml

html:
	oscap xccdf generate guide --profile xccdf_io.github.bdenning_profile_default security-baseline.xml >> security-baseline.html

validate:
	oscap xccdf validate security-baseline.xml

clean:
	rm -frv *~
	rm security-baseline.html

.phony: clean
