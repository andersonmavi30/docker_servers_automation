# 🐧 docker_servers_automation

🇺🇸 [English](README.md)

Entorno reproducible de **Automatización de Servidores Linux basado en Docker**, enfocado en **Red Hat Enterprise Linux (RHEL)** y **Rocky Linux**, diseñado para administración con Ansible, Infrastructure as Code y flujos DevOps.

Este repositorio proporciona un workspace portable de automatización con **Ansible Core, Python, Docker SDK y utilidades de administración Linux**, permitiendo ejecutar las herramientas de automatización de forma consistente sin instalar todo el stack directamente sobre el sistema host.

---

## 🎯 Objetivo del proyecto

El objetivo de este proyecto es proporcionar un entorno reutilizable y contenerizado para la administración y automatización de servidores Linux.

El entorno está diseñado para:

- Automatización de servidores Linux
- Gestión de configuración basada en Ansible
- Infrastructure as Code
- Automatización con Python
- Administración de servidores mediante SSH
- Automatización de Docker
- Flujos basados en Git
- Validación y reportes
- Prácticas DevOps
- Entornos de automatización reproducibles

---

## 🐧 Plataformas objetivo

Alcance actual del proyecto:

| Plataforma | Rol |
|---|---|
| **Red Hat Enterprise Linux (RHEL)** | Objetivo de automatización para Linux empresarial |
| **Rocky Linux** | Objetivo de automatización compatible con RHEL |

Se podrán incorporar distribuciones Linux adicionales a medida que evolucione el proyecto.

---

## 🧱 Base del contenedor

La imagen Docker actual está basada en:

```text
Rocky Linux 10
```

El contenedor incluye las principales herramientas del sistema operativo necesarias para funcionar como workspace de automatización Linux.

### Paquetes del sistema

```text
python3
python3-pip
openssh-clients
git
sshpass
iproute
sudo
```

Estos paquetes proporcionan ejecución de Python, conectividad SSH, integración con Git y capacidades básicas de networking y administración Linux.

---

## 🐍 Stack de automatización Python

El archivo `requirements.txt` actual instala:

| Paquete | Propósito |
|---|---|
| `ansible-core>=2.16` | Motor principal de automatización Ansible |
| `docker>=7.0.0` | Docker SDK para Python |
| `netaddr` | Manipulación de direcciones IP y redes |
| `jmespath` | Consultas y filtrado de datos estructurados |

El stack Python proporciona la base para automatización de servidores, procesamiento de datos e integración con infraestructura contenerizada.

---

## 🤖 Colecciones Ansible

El archivo `collections.yml` actual instala:

```text
community.docker
ansible.posix
community.general
ansible.utils
```

### `community.docker`

Proporciona módulos y plugins para administrar contenedores Docker, imágenes, redes y recursos relacionados.

### `ansible.posix`

Proporciona módulos y plugins orientados a Linux y POSIX para administración de sistemas.

### `community.general`

Amplía Ansible con módulos adicionales útiles para infraestructura Linux y flujos de automatización.

### `ansible.utils`

Proporciona utilidades, filtros y plugins usados habitualmente para procesamiento de datos estructurados y automatización de infraestructura.

---

## 👤 Ejecución como usuario no-root

La imagen Docker crea un usuario dedicado para automatización:

```text
adminserver
```

El usuario está configurado con:

```text
HOME: /home/adminserver
SHELL: /bin/bash
WORKDIR: /ansible
```

El contenedor cambia de `root` a `adminserver` antes de la ejecución.

Actualmente el usuario tiene privilegios sudo sin contraseña:

```text
adminserver ALL=(ALL) NOPASSWD:ALL
```

Esto permite ejecutar tareas administrativas mediante `sudo` manteniendo la sesión predeterminada del contenedor bajo un usuario no-root.

> El sudo sin contraseña es conveniente para automatización y laboratorios controlados. En producción debe ajustarse a la política de seguridad y a los requisitos de mínimos privilegios del entorno objetivo.

---

## 📂 Directorio de trabajo

El workspace de automatización dentro del contenedor es:

```text
/ansible
```

Este directorio pertenece a `adminserver` y está pensado para contener inventarios, playbooks, roles y archivos de automatización montados o agregados al contenedor.

---

## 🗂️ Estructura actual del repositorio

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

Construye el entorno de automatización sobre Rocky Linux 10, instala los paquetes del sistema, las dependencias Python y las colecciones Ansible, y configura el usuario no-root `adminserver`.

### `requirements.txt`

Define las dependencias Python de automatización instaladas dentro de la imagen.

### `collections.yml`

Define las colecciones Ansible instaladas durante el build de Docker.

---

## ⚡ Construir la imagen

Desde la raíz del repositorio:

```bash
docker build -t docker_servers_automation .
```

Explicación del comando:

- `docker build` — construye una imagen Docker.
- `-t docker_servers_automation` — asigna el nombre a la imagen.
- `.` — utiliza el directorio actual como contexto del build.

---

## 🚀 Ejecutar el contenedor

Ejecuta un contenedor interactivo:

```bash
docker run --rm -it docker_servers_automation
```

Opciones:

- `--rm` — elimina el contenedor cuando termina.
- `-it` — abre una terminal interactiva.

Como el Dockerfile define:

```dockerfile
CMD ["/bin/bash"]
```

el contenedor inicia directamente en una shell Bash con el usuario `adminserver`.

---

## 📁 Montar un workspace de automatización

Puedes montar un directorio local dentro de `/ansible`:

```bash
docker run --rm -it \
  -v "$PWD:/ansible" \
  docker_servers_automation
```

Esto permite utilizar directamente dentro del contenedor playbooks, inventarios, scripts y otros archivos de automatización ubicados en el host.

---

## ✅ Validar el entorno

Después de construir la imagen:

```bash
ansible --version
```

Verifica las colecciones instaladas:

```bash
ansible-galaxy collection list
```

Verifica las dependencias Python:

```bash
python3 -m pip show ansible-core docker netaddr jmespath
```

Comprueba el usuario actual:

```bash
whoami
```

Resultado esperado:

```text
adminserver
```

Valida el acceso sudo:

```bash
sudo whoami
```

Resultado esperado:

```text
root
```

---

## 🚀 Alcance de automatización

El entorno está pensado para soportar progresivamente flujos de automatización de servidores Linux como:

- Recolección de información del sistema operativo
- Instalación y actualización de paquetes
- Gestión de usuarios y grupos
- Administración SSH
- Gestión de servicios
- Administración de sistemas de archivos y almacenamiento
- Configuración de red
- Gestión de firewall
- Hardening del sistema
- Validación de baselines de seguridad
- Gestión de parches
- Backups de configuración
- Health checks
- Monitoreo de CPU, memoria y disco
- Recolección de logs
- Validación de configuración
- Inventario y reportes
- Flujos pre-check y post-check
- Remediación automatizada
- Operaciones sobre múltiples servidores
- Administración de Docker
- Integración CI/CD

---

## ⚙️ Arquitectura de automatización

```text
Repositorio Git
      │
      ▼
Entorno Docker de automatización
      │
      ├── Ansible Core
      ├── Python 3
      ├── Docker SDK
      ├── Colecciones Ansible
      ├── Cliente SSH
      └── Utilidades Linux
      │
      ▼
Servidores Linux
      │
      ├── RHEL
      └── Rocky Linux
      │
      ▼
Validación / Reportes / Remediación
```

El objetivo es mantener el entorno de automatización, las dependencias y los flujos de trabajo de forma reproducible y versionada.

---

## 🔄 Enfoque DevOps / Infrastructure Automation

El proyecto está diseñado alrededor de un flujo repetible:

```text
Git
 │
 ▼
Validación
 │
 ▼
Automatización contenerizada
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

Este enfoque ayuda a que los flujos de administración de servidores sean consistentes, repetibles y auditables.

---

## 🧪 Primero en laboratorio

Toda automatización desarrollada con esta imagen debe validarse primero en laboratorios o entornos controlados antes de adaptarse a infraestructura de producción.

---

## 🔒 Principios de seguridad

- No almacenar contraseñas ni secretos dentro de imágenes Docker.
- No commitear credenciales en Git.
- Preferir claves SSH, gestores de secretos o credenciales de plataformas de automatización.
- Aplicar mínimos privilegios siempre que sea posible.
- Revisar el uso de sudo sin contraseña antes de producción.
- Validar la automatización antes de despliegues productivos.
- Mantener dependencias y código de automatización bajo control de versiones.

---

## 🔗 Proyectos relacionados

- [servers_automation](https://github.com/andersonmavi30/servers_automation)
- [docker_network_automation](https://github.com/andersonmavi30/docker_network_automation)
- [docker_firewall_automation](https://github.com/andersonmavi30/docker_firewall_automation)
- [docker_loadbalancers_automation](https://github.com/andersonmavi30/docker_loadbalancers_automation)

---

## 🗺️ Roadmap

El entorno Docker base de automatización ya está implementado.

El trabajo futuro puede incluir:

- Agregar inventarios Ansible de ejemplo
- Agregar roles Ansible reutilizables
- Agregar ejemplos de automatización para RHEL
- Agregar ejemplos de automatización para Rocky Linux
- Agregar utilidades administrativas en Bash
- Agregar scripts de automatización en Python
- Agregar flujos pre-check y post-check
- Agregar reportes de salud del sistema
- Agregar remediación automatizada
- Agregar smoke tests del contenedor
- Agregar validación CI/CD
- Publicar imágenes Docker versionadas

---

## 📊 Estado del repositorio

> 🚧 **Entorno base de automatización implementado / Desarrollo continuo**

Base actualmente implementada:

**Rocky Linux 10 | Ansible Core | Python 3 | Docker SDK | SSH | Linux Automation**

Plataformas objetivo:

**RHEL | Rocky Linux**

---

## 📄 Licencia

Este proyecto está licenciado bajo la [MIT License](LICENSE).

## 👨‍💻 Autor

**Anderson Martinez Virviescas**

Network Administrator | Firewall Administrator | Network Automation | NetDevOps | Linux | Infrastructure Automation

GitHub: [@andersonmavi30](https://github.com/andersonmavi30)

---

> Automatiza la infraestructura. Estandariza las operaciones. Haz los cambios reproducibles.
