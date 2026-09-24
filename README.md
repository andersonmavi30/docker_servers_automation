# 🐧 docker_servers_automation

🇨🇴 [Español](README.es.md)

A reproducible **Docker-based Linux Server Automation environment** focused on **Red Hat Enterprise Linux (RHEL)** and **Rocky Linux**, built for Ansible-driven administration, Infrastructure as Code and DevOps workflows.

This repository provides a portable automation workspace with **Ansible Core, Python, Docker SDK and Linux administration utilities**, allowing server automation tooling to run consistently without installing the complete stack directly on the host system.

---

## 🎯 Project Objective

The objective of this project is to provide a reusable containerized environment for Linux server administration and automation.

The environment is designed for:

- Linux Server Automation
- Ansible-based configuration management
- Infrastructure as Code
- Python automation
- SSH-based server administration
- Docker automation
- Git-based workflows
- Validation and reporting
- DevOps practices
- Reproducible automation environments

---

## 🐧 Target Platforms

Current project scope:

| Platform | Role |
|---|---|
| **Red Hat Enterprise Linux (RHEL)** | Enterprise Linux automation target |
| **Rocky Linux** | RHEL-compatible Linux automation target |

Additional Linux distributions may be incorporated as the project evolves.

---

## 🧱 Container Base

The current Docker image is based on:

```text
Rocky Linux 10
```

The container includes the main operating system tools required to act as a Linux automation workspace.

### System packages

```text
python3
python3-pip
openssh-clients
git
sshpass
iproute
sudo
```

These packages provide Python execution, SSH connectivity, Git integration and basic Linux networking and administration capabilities.

---

## 🐍 Python Automation Stack

The current `requirements.txt` installs:

| Package | Purpose |
|---|---|
| `ansible-core>=2.16` | Core Ansible automation engine |
| `docker>=7.0.0` | Docker SDK for Python |
| `netaddr` | IP address and network manipulation |
| `jmespath` | Structured data queries and filtering |

The Python stack provides the foundation for server automation, data processing and integration with containerized infrastructure.

---

## 🤖 Ansible Collections

The current `collections.yml` installs:

```text
community.docker
ansible.posix
community.general
ansible.utils
```

### `community.docker`

Provides modules and plugins for managing Docker containers, images, networks and related resources.

### `ansible.posix`

Provides Linux and POSIX-oriented modules and plugins for system administration.

### `community.general`

Extends Ansible with additional modules useful across Linux infrastructure and automation workflows.

### `ansible.utils`

Provides utilities, filters and plugins commonly used for structured data processing and infrastructure automation.

---

## 👤 Non-root Execution

The Docker image creates a dedicated automation user:

```text
adminserver
```

The user is configured with:

```text
HOME: /home/adminserver
SHELL: /bin/bash
WORKDIR: /ansible
```

The container switches from `root` to `adminserver` before execution.

The user currently has passwordless sudo privileges:

```text
adminserver ALL=(ALL) NOPASSWD:ALL
```

This allows administrative tasks to be executed through `sudo` while keeping the default container session under a non-root user.

> Passwordless sudo is convenient for controlled automation and laboratory environments. Production use should follow the security policy and least-privilege requirements of the target environment.

---

## 📂 Working Directory

The automation workspace inside the container is:

```text
/ansible
```

This directory is owned by `adminserver` and is intended to contain inventories, playbooks, roles and automation files mounted or added to the container.

---

## 🗂️ Current Repository Structure

```text
docker_servers_automation/
│
├── Dockerfile
├── requirements.txt
├── collections.yml
├── LICENSE
├── README.md
└── README.es.md
```

### `Dockerfile`

Builds the Rocky Linux 10 automation environment, installs system packages, Python dependencies and Ansible collections, and configures the `adminserver` non-root user.

### `requirements.txt`

Defines the Python automation dependencies installed inside the image.

### `collections.yml`

Defines the Ansible collections installed during the Docker build.

---

## ⚡ Build the Image

From the repository root:

```bash
docker build -t docker_servers_automation .
```

Command explanation:

- `docker build` — builds a Docker image.
- `-t docker_servers_automation` — assigns the image name.
- `.` — uses the current directory as the Docker build context.

---

## 🚀 Run the Container

Run an interactive container:

```bash
docker run --rm -it docker_servers_automation
```

Options:

- `--rm` — removes the container when it exits.
- `-it` — allocates an interactive terminal.

Because the Dockerfile defines:

```dockerfile
CMD ["/bin/bash"]
```

the container starts directly in a Bash shell as the `adminserver` user.

---

## 📁 Mount an Automation Workspace

A local project directory can be mounted into `/ansible`:

```bash
docker run --rm -it \
  -v "$PWD:/ansible" \
  docker_servers_automation
```

This allows playbooks, inventories, scripts and other automation files from the host to be used directly inside the container.

---

## ✅ Validate the Environment

After building the image:

```bash
ansible --version
```

Verify installed collections:

```bash
ansible-galaxy collection list
```

Verify Python dependencies:

```bash
python3 -m pip show ansible-core docker netaddr jmespath
```

Check the current user:

```bash
whoami
```

Expected result:

```text
adminserver
```

Validate sudo access:

```bash
sudo whoami
```

Expected result:

```text
root
```

---

## 🚀 Automation Scope

The environment is intended to progressively support Linux server automation workflows such as:

- Operating system information collection
- Package installation and updates
- User and group management
- SSH administration
- Service management
- Filesystem and storage administration
- Network configuration
- Firewall management
- System hardening
- Security baseline validation
- Patch management
- Configuration backups
- Health checks
- CPU, memory and disk monitoring
- Log collection
- Configuration validation
- Inventory and reporting
- Pre-check and post-check workflows
- Automated remediation
- Multi-server operations
- Docker administration
- CI/CD integration

---

## ⚙️ Automation Architecture

```text
Git Repository
      │
      ▼
Docker Automation Environment
      │
      ├── Ansible Core
      ├── Python 3
      ├── Docker SDK
      ├── Ansible Collections
      ├── SSH Client
      └── Linux Utilities
      │
      ▼
Linux Servers
      │
      ├── RHEL
      └── Rocky Linux
      │
      ▼
Validation / Reporting / Remediation
```

The goal is to keep the automation environment, dependencies and workflows reproducible and version controlled.

---

## 🔄 DevOps / Infrastructure Automation Approach

The project is designed around a repeatable workflow:

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

This approach helps make server administration workflows consistent, repeatable and auditable.

---

## 🧪 Lab First

Automation developed with this image should first be validated in laboratory or controlled environments before being adapted to production infrastructure.

---

## 🔒 Security Principles

- Do not store passwords or secrets inside Docker images.
- Do not commit credentials to Git.
- Prefer SSH keys, secret stores or automation-platform credentials.
- Apply least-privilege access whenever possible.
- Review passwordless sudo before production usage.
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

The base Docker automation environment is now implemented.

Future work may include:

- Add example Ansible inventories
- Add reusable Ansible roles
- Add RHEL automation examples
- Add Rocky Linux automation examples
- Add Bash administration utilities
- Add Python automation scripts
- Add pre-check and post-check workflows
- Add system health reporting
- Add automated remediation
- Add container smoke tests
- Add CI/CD validation
- Add versioned Docker image publishing

---

## 📊 Repository Status

> 🚧 **Base Automation Environment Implemented / Continuous Development**

Current implemented foundation:

**Rocky Linux 10 | Ansible Core | Python 3 | Docker SDK | SSH | Linux Automation**

Target platforms:

**RHEL | Rocky Linux**

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 👨‍💻 Author

**Anderson Martinez Virviescas**

Network Administrator | Firewall Administrator | Network Automation | NetDevOps | Linux | Infrastructure Automation

GitHub: [@andersonmavi30](https://github.com/andersonmavi30)

---

> Automate infrastructure. Standardize operations. Make changes reproducible.
