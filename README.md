# Ansible from Zero

The code for the **Ansible** video course: four small Debian servers (a load balancer, two web servers and a
database server) run as containers on your own computer, and everything needed to manage them with Ansible, from a
first ad-hoc command to a tested, rolling deployment of a web app with PostgreSQL behind a load balancer.

The root of this repository is the finished project as it stands at the end of the latest chapter. Each chapter's
finished project is in [`chapters/`](chapters).

## Run the lab

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
ssh-keygen -t ed25519 -f ~/.ssh/ansible_lab -N '' -C ansible-lab
cp ~/.ssh/ansible_lab.pub lab/authorized_keys
docker compose up -d --build
ansible all -m ping
```

The lab servers run systemd inside privileged containers, which a real server would not need. Windows is supported as
a control node only through WSL.

From chapter 6 on, install the Galaxy content with `ansible-galaxy install -r requirements.yml`. From chapter 7 on, the
vaulted files use the lab password shown in the videos, `battery-staple-two`: put it in a `.vault_pass` file next to
`ansible.cfg` (`printf 'battery-staple-two\n' > .vault_pass && chmod 600 .vault_pass`). It protects lab values only;
use your own password for anything real. The cloud playbooks in `cloud/` (chapter 10) need your own AWS credentials in
environment variables, and `cloud/teardown.yml` removes everything they create.

| # | Chapter | Folder |
|---|---------|--------|
| 1 | Install Ansible and Run Your First Commands | [chapters/01-install-ansible-and-run-your-first-commands](chapters/01-install-ansible-and-run-your-first-commands) |
| 2 | Inventories | [chapters/02-inventories](chapters/02-inventories) |
| 3 | Your First Playbook | [chapters/03-your-first-playbook](chapters/03-your-first-playbook) |
| 4 | Variables, Facts and Templates | [chapters/04-variables-facts-and-templates](chapters/04-variables-facts-and-templates) |
| 5 | Conditionals, Loops, Handlers and Errors | [chapters/05-conditionals-loops-handlers-and-errors](chapters/05-conditionals-loops-handlers-and-errors) |
| 6 | Roles and Collections | [chapters/06-roles-and-collections](chapters/06-roles-and-collections) |
| 7 | Secrets with Ansible Vault | [chapters/07-secrets-with-ansible-vault](chapters/07-secrets-with-ansible-vault) |
| 8 | Deploy the Full Stack | [chapters/08-deploy-the-full-stack](chapters/08-deploy-the-full-stack) |
| 9 | Test Your Automation: ansible-lint and Molecule | [chapters/09-test-your-automation](chapters/09-test-your-automation) |
| 10 | Cloud Servers and PowerShell: AWS, Windows and pwsh | [chapters/10-cloud-servers-and-powershell](chapters/10-cloud-servers-and-powershell) |
| 11 | Debug and Speed Up Playbooks | [chapters/11-debug-and-speed-up-playbooks](chapters/11-debug-and-speed-up-playbooks) |
| 12 | Execution Environments, CI and AWX | [chapters/12-execution-environments-ci-and-awx](chapters/12-execution-environments-ci-and-awx) |

## Versions

Ansible 14.6.0 (ansible-core 2.21.6) on Python 3.12, Debian 13 (trixie) servers with Python 3.13.

## License

MIT
