all:	html datastream

datastream:	resolve
	oscap ds sds-compose security-baseline-resolved.xml security-baseline-ds.xml

html:	resolve
	oscap xccdf generate guide --profile xccdf_io.github.bdenning_profile_default security-baseline-resolved.xml > security-baseline.html

resolve:
	oscap xccdf resolve -o security-baseline-resolved.xml security-baseline.xml

clean:
	rm -frv *~
	rm -f security-baseline-ds.xml
	rm -f security-baseline-resolved.xml
	rm -f security-baseline.html

.phony: clean
