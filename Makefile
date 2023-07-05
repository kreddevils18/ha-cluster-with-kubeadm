.PHONY: cluster

cluster:
	ansible-playbook -i inventory/development/inventory.yaml playbooks/cluster.yaml --vault-password-file /vagrant/vault_password.txt
