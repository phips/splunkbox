.PHONY: ips

play:
	@ansible-playbook $(OPTS) site.yml

ips:
	@ansible -m setup -a 'filter=ansible_default_ipv4' head
