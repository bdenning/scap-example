all:	validate resolve html example

example:
	oscap ds sds-compose resolved-security-baseline.xml security-baseline-ds.xml

html:
	oscap xccdf generate guide --profile xccdf_io.github.bdenning_profile_default resolved-security-baseline.xml > security-baseline.html

validate:
	oscap xccdf validate security-baseline.xml

resolve:
	oscap xccdf resolve -o resolved-security-baseline.xml security-baseline.xml

clean:
	rm -frv *~
	rm -f security-baseline-ds.xml
	rm -f resolved-security-baseline.xml
	rm -f security-baseline.html

.phony: clean
