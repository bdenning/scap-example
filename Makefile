all:	html datastream

datastream:
	oscap ds sds-compose security-baseline.xml security-baseline-ds.xml

html:	
	oscap xccdf generate guide --profile xccdf_io.github.bdenning_profile_default security-baseline.xml > security-baseline.html

clean:
	rm -frv *~
	rm -f security-baseline-ds.xml
	rm -f security-baseline.html

.phony: clean
