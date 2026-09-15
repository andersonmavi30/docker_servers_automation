# 🐧 docker_servers_automation

🇨🇴 [Español](README.es.md)

Docker-based project focused on building a **reproducible Linux Server Automation environment** for **Red Hat Enterprise Linux (RHEL)** and **Rocky Linux**.

The repository is intended to provide a portable automation workspace for Linux server administration, Infrastructure as Code and DevOps workflows, following the same containerized approach used across my Network Automation, Firewall Automation and Load Balancer Automation projects.

---

## 🎯 Project Objective

The objective of this repository is to build a reusable Docker environment for automating common Linux server administration tasks without installing the complete automation stack directly on the host system.

The project is designed around:

- Linux Server Automation
- Reproducible Docker environments
- Infrastructure as Code
- Configuration management
- Python and Bash automation
- Ansible-based workflows
- Git-based version control
- DevOps practices
- Validation and reporting

---

## 🐧 Target Platforms

Current repository scope:

| Platform | Role |
|---|---|
| **Red Hat Enterprise Linux (RHEL)** | Enterprise Linux server automation target |
| **Rocky Linux** | RHEL-compatible Linux server automation target |

Additional Linux distributions may be incorporated as the project evolves.

---

## 🧰 Planned Automation Stack

> 🚧 The repository is currently in its initial stage. The components below describe the intended automation environment and will be added progressively.

### 🤖 Ansible

Planned for configuration management and repeatable server administration workflows such as:

- Package management
- User and group administration
- Service management
- Filesystem configuration
- Network configuration
- Firewall configuration
- SSH administration
- System hardening
- Patch management
- Configuration validation

### 🐍 Python

Planned for tasks requiring custom logic, API interaction, data processing, validation and reporting.

### 🐚 Bash

Planned for Linux-native administration tasks, bootstrap operations and lightweight automation inside controlled environments.

### 🐳 Docker

The project will package the automation toolchain inside a reusable container so the same environment can be used consistently across different hosts and labs.

---

## 🚀 Planned Automation Areas

The repository will progressively include automation for:

- Operating system information collection
- Package installation and updates
- User and group management
- SSH configuration
- Service management
- Filesystem and storage checks
- Network configuration
- Firewall management
- System hardening
- Security baseline validation
- Patch management
- Configuration backups
- Health checks
- CPU, memory and disk utilization checks
- Log collection
- Configuration validation
- Inventory and reporting
- Pre-check and post-check workflows
- Automated remediation
- Multi-server operations
- CI/CD integration

---

## ⚙️ Planned Architecture

```text
Git Repository
      │
      ▼
Docker Image
      │
      ├── Ansible
      ├── Python
      ├── Bash
      └── Linux Utilities
      │
      ▼
Linux Servers
      │
      ├── RHEL
      └── Rocky Linux
      │
      ▼
Validation / Reporting
```

The goal is to keep the automation code, dependencies and execution environment reproducible and version controlled.

---

## 🗂️ Current Repository Structure

```text
docker_servers_automation/
│
├── LICENSE
├── README.md
└── README.es.md
```

The repository is currently at the documentation and project-definition stage. Docker, Python, Ansible and automation files will be added progressively as the implementation begins.

---

## 🗂️ Planned Repository Structure

```text
docker_servers_automation/
│
├── Dockerfile
├── requirements.txt
├── collections.yml
├── ansible/
│   ├── inventories/
│   ├── playbooks/
│   └── roles/
├── python/
├── bash/
├── docs/
├── README.md
├── README.es.md
└── LICENSE
```

The final structure may evolve according to the automation workflows implemented in the project.

---

## 🔄 DevOps / Infrastructure Automation Approach

The long-term workflow is intended to follow a repeatable model:

```text
Git
 │
 ▼
Validation
 │
 ▼
Containerized Automation
 │
 ▼
Linux Servers
 │
 ▼
Post-check
 │
 ▼
Reporting / Remediation
```

This approach helps keep server administration changes version controlled, repeatable and auditable.

---

## 🧪 Lab First

Automation developed in this repository should first be validated in laboratory or controlled environments before being adapted to production servers.

---

## 🔒 Security Principles

- Do not store passwords or secrets inside Docker images.
- Do not commit credentials to Git.
- Prefer SSH keys, secret stores or automation-platform credentials.
- Apply least-privilege access whenever possible.
- Validate automation before production deployment.
- Keep dependencies and automation code version controlled.

---

## 🔗 Related Projects

- [servers_automation](https://github.com/andersonmavi30/servers_automation)
- [docker_network_automation](https://github.com/andersonmavi30/docker_network_automation)
- [docker_firewall_automation](https://github.com/andersonmavi30/docker_firewall_automation)
- [docker_loadbalancers_automation](https://github.com/andersonmavi30/docker_loadbalancers_automation)

---

## 🗺️ Roadmap

- Build the initial Docker image
- Define the Python dependencies
- Add Ansible Core and required collections
- Add RHEL automation examples
- Add Rocky Linux automation examples
- Add Bash administration utilities
- Add reusable Ansible roles
- Add inventory examples
- Add pre-check and post-check workflows
- Add system health reporting
- Add automated validation
- Add CI/CD checks
- Add container smoke tests

---

## 📊 Repository Status

> 🚧 **Initial Development / Work in Progress**

Current defined scope:

**Docker | Linux Server Automation | RHEL | Rocky Linux | Infrastructure as Code | DevOps**

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 👨‍💻 Author

**Anderson Martinez Virviescas**

Network Administrator | Network Automation | NetDevOps | Linux | Infrastructure Automation | Cybersecurity

GitHub: [@andersonmavi30](https://github.com/andersonmavi30)

---

> Automate infrastructure. Standardize operations. Make changes reproducible.
