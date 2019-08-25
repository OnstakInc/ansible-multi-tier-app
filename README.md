
## Multi Tier Application

#### Requirements
* Ansible should be pre-installed on the control machine

#### Installation Guide
* Navigate to the main repository directory
* Add you application hosts to inventory file
* Also add username and password for all the hosts i.e. inventory/hosts
```
[lb]
10.39.115.213

[app]
10.39.115.212

[db]
10.39.115.212

[all:vars]
ansible_user=root
ansible_password=123456778
ansible_sudo_pass=12345678
```
* Run the following command to initialize the deployment
```
ansible-playbook playbooks/deploy.yml
```
* Note: You can also provide username and password while executing playbooks
```
ansible-playbook playbooks/deploy.yml --extra-vars "ansible_user=root ansible_password=your-password ansible_sudo_pass=sudo-password"
```
