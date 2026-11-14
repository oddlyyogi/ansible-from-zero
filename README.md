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

| # | Chapter | Folder |
|---|---------|--------|
| 1 | Install Ansible and Run Your First Commands | [chapters/01-install-ansible-and-run-your-first-commands](chapters/01-install-ansible-and-run-your-first-commands) |
| 2 | Inventories | [chapters/02-inventories](chapters/02-inventories) |
| 3 | Your First Playbook | [chapters/03-your-first-playbook](chapters/03-your-first-playbook) |
| 4 | Variables, Facts and Templates | [chapters/04-variables-facts-and-templates](chapters/04-variables-facts-and-templates) |
| 5 | Conditionals, Loops, Handlers and Errors | coming soon |
| 6 | Roles and Collections | coming soon |
| 7 | Secrets with Ansible Vault | coming soon |
| 8 | Deploy the Full Stack | coming soon |
| 9 | Test Your Automation: ansible-lint and Molecule | coming soon |
| 10 | Cloud and PowerShell Hosts | coming soon |
| 11 | Debug and Speed Up Playbooks | coming soon |
| 12 | Execution Environments and CI | coming soon |

## Versions

Ansible 14.6.0 (ansible-core 2.21.6) on Python 3.12, Debian 13 (trixie) servers with Python 3.13.

## License

MIT
