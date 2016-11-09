# Example SCAP Content
Some SCAP content that I've created with the intention of learning the SCAP XML.


```bash
# Install OpenSCAP and build the datastream
yum install -y openscap-scanner openscap-engine-sce python-jinja2
make

# Read the doco
firefox example-xccdf.html

# Evaluate compliance against the baseline
oscap xccdf eval example-xccdf-ds.xml

# Create an Ansible playbook to remediate non-compliant settings
make fix

# Remediate non-compliant hosts
ansible-playbook -c local -i localhost, example-playbook.yml

# Tidy up
make clean
```

* The content is based off a series of tutorials by Sven Vermeulen: http://blog.siphos.be/2013/12/running-a-bit-with-the-xccdf-document/.
* The remediation content was created using guidance from Zbyněk Moravec: https://blog-zbynek.rhcloud.com/2016/09/12/ssg-openscap-and-ansible/
