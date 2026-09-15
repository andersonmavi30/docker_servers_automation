# 🐧 docker_servers_automation

🇺🇸 [English](README.md)

Proyecto basado en Docker enfocado en construir un **entorno reproducible para Automatización de Servidores Linux** sobre **Red Hat Enterprise Linux (RHEL)** y **Rocky Linux**.

El repositorio está orientado a proporcionar un workspace portable de automatización para administración de servidores Linux, Infrastructure as Code y flujos DevOps, siguiendo el mismo enfoque basado en contenedores utilizado en mis proyectos de Network Automation, Firewall Automation y Load Balancer Automation.

---

## 🎯 Objetivo del proyecto

El objetivo de este repositorio es construir un entorno Docker reutilizable para automatizar tareas comunes de administración de servidores Linux sin instalar todo el stack de automatización directamente sobre el sistema host.

El proyecto está diseñado alrededor de:

- Automatización de servidores Linux
- Entornos Docker reproducibles
- Infrastructure as Code
- Gestión de configuración
- Automatización con Python y Bash
- Flujos basados en Ansible
- Control de versiones con Git
- Prácticas DevOps
- Validación y reportes

---

## 🐧 Plataformas objetivo

Alcance actual del repositorio:

| Plataforma | Rol |
|---|---|
| **Red Hat Enterprise Linux (RHEL)** | Objetivo de automatización para servidores Linux empresariales |
| **Rocky Linux** | Objetivo compatible con RHEL para automatización de servidores Linux |

Se podrán incorporar distribuciones Linux adicionales a medida que el proyecto evolucione.

---

## 🧰 Stack de automatización previsto

> 🚧 El repositorio se encuentra actualmente en su etapa inicial. Los componentes siguientes describen el entorno previsto y se irán agregando progresivamente.

### 🤖 Ansible

Previsto para gestión de configuración y flujos repetibles de administración de servidores, por ejemplo:

- Gestión de paquetes
- Administración de usuarios y grupos
- Gestión de servicios
- Configuración de sistemas de archivos
- Configuración de red
- Configuración de firewall
- Administración SSH
- Hardening del sistema
- Gestión de parches
- Validación de configuración

### 🐍 Python

Previsto para tareas que requieran lógica personalizada, interacción con APIs, procesamiento de datos, validación y reportes.

### 🐚 Bash

Previsto para tareas nativas de administración Linux, operaciones de bootstrap y automatización ligera en entornos controlados.

### 🐳 Docker

El proyecto empaquetará el stack de automatización dentro de un contenedor reutilizable para poder utilizar el mismo entorno de forma consistente en distintos hosts y laboratorios.

---

## 🚀 Áreas de automatización previstas

El repositorio incorporará progresivamente automatización para:

- Recolección de información del sistema operativo
- Instalación y actualización de paquetes
- Gestión de usuarios y grupos
- Configuración SSH
- Gestión de servicios
- Verificación de sistemas de archivos y almacenamiento
- Configuración de red
- Gestión de firewall
- Hardening del sistema
- Validación de baselines de seguridad
- Gestión de parches
- Backups de configuración
- Health checks
- Verificación de CPU, memoria y disco
- Recolección de logs
- Validación de configuración
- Inventario y reportes
- Flujos pre-check y post-check
- Remediación automatizada
- Operaciones sobre múltiples servidores
- Integración CI/CD

---

## ⚙️ Arquitectura prevista

```text
Repositorio Git
      │
      ▼
Imagen Docker
      │
      ├── Ansible
      ├── Python
      ├── Bash
      └── Utilidades Linux
      │
      ▼
Servidores Linux
      │
      ├── RHEL
      └── Rocky Linux
      │
      ▼
Validación / Reportes
```

El objetivo es mantener el código de automatización, las dependencias y el entorno de ejecución de manera reproducible y versionada.

---

## 🗂️ Estructura actual del repositorio

```text
docker_servers_automation/
│
├── LICENSE
├── README.md
└── README.es.md
```

Actualmente el repositorio se encuentra en la etapa de documentación y definición del proyecto. Los archivos Docker, Python, Ansible y de automatización se agregarán progresivamente cuando comience la implementación.

---

## 🗂️ Estructura prevista del repositorio

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

La estructura final podrá evolucionar de acuerdo con los flujos de automatización que se implementen en el proyecto.

---

## 🔄 Enfoque DevOps / Infrastructure Automation

El flujo a largo plazo está pensado para seguir un modelo repetible:

```text
Git
 │
 ▼
Validación
 │
 ▼
Automatización en contenedor
 │
 ▼
Servidores Linux
 │
 ▼
Post-check
 │
 ▼
Reportes / Remediación
```

Este enfoque permite mantener los cambios de administración de servidores versionados, repetibles y auditables.

---

## 🧪 Primero en laboratorio

Toda automatización desarrollada en este repositorio debe validarse primero en laboratorios o entornos controlados antes de adaptarse a servidores de producción.

---

## 🔒 Principios de seguridad

- No almacenar contraseñas ni secretos dentro de imágenes Docker.
- No commitear credenciales en Git.
- Preferir claves SSH, gestores de secretos o credenciales de plataformas de automatización.
- Aplicar mínimos privilegios siempre que sea posible.
- Validar la automatización antes de producción.
- Mantener dependencias y código de automatización bajo control de versiones.

---

## 🔗 Proyectos relacionados

- [servers_automation](https://github.com/andersonmavi30/servers_automation)
- [docker_network_automation](https://github.com/andersonmavi30/docker_network_automation)
- [docker_firewall_automation](https://github.com/andersonmavi30/docker_firewall_automation)
- [docker_loadbalancers_automation](https://github.com/andersonmavi30/docker_loadbalancers_automation)

---

## 🗺️ Roadmap

- Construir la imagen Docker inicial
- Definir las dependencias de Python
- Agregar Ansible Core y las colecciones necesarias
- Agregar ejemplos de automatización para RHEL
- Agregar ejemplos de automatización para Rocky Linux
- Agregar utilidades administrativas en Bash
- Agregar roles Ansible reutilizables
- Agregar ejemplos de inventario
- Agregar flujos pre-check y post-check
- Agregar reportes de salud del sistema
- Agregar validación automatizada
- Agregar validaciones CI/CD
- Agregar smoke tests del contenedor

---

## 📊 Estado del repositorio

> 🚧 **Desarrollo inicial / Work in Progress**

Alcance actual definido:

**Docker | Linux Server Automation | RHEL | Rocky Linux | Infrastructure as Code | DevOps**

---

## 📄 Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).

## 👨‍💻 Autor

**Anderson Martinez Virviescas**

Network Administrator | Network Automation | NetDevOps | Linux | Infrastructure Automation | Cybersecurity

GitHub: [@andersonmavi30](https://github.com/andersonmavi30)

---

> Automatiza la infraestructura. Estandariza las operaciones. Haz los cambios reproducibles.
