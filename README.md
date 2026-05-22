# 🚀 Innovatech - API REST Despacho (Backend)

Este repositorio contiene la API REST para el sistema de gestión de despachos de **Innovatech**, desarrollada en **Spring Boot** y configurada bajo estándares DevOps de alta disponibilidad, seguridad y automatización.

## 🛠️ Tecnologías Utilizadas
* **Backend:** Java 17 / Spring Boot
* **Base de Datos:** PostgreSQL 15 (Alpine)
* **Contenedorización:** Docker & Docker Compose
* **CI/CD:** GitHub Actions
* **Cloud Infrastructure:** AWS EC2

## 🔒 Buenas Prácticas de Seguridad Aplicadas (Rúbrica)
* **Multi-stage Build:** Optimización de capas en el `Dockerfile` para reducir el tamaño de la imagen final y remover herramientas de compilación innecesarias en producción.
* **Usuario No-Root:** El contenedor ejecuta la aplicación bajo un usuario de mínimos privilegios (`devops_user`), mitigando riesgos de escalada de privilegios.
* **Aislamiento de Red:** La base de datos y la API se comunican a través de una red privada virtual de Docker (`bridge`), aislando la base de datos del acceso público directo.
* **Persistencia de Datos:** Implementación de un *Named Volume* (`db-data`) gestionado por Docker para asegurar la continuidad operativa de los datos.

## 🚀 Pipeline de CI/CD (GitHub Actions)
El archivo `.github/workflows/deploy.yml` automatiza el flujo completo:
1. **CI:** Compila el proyecto con Maven, construye la imagen Docker y la sube de forma segura a **Docker Hub**.
2. **CD:** Se conecta vía **SSH** a la instancia **AWS EC2**, descarga la nueva imagen y reinicia los servicios utilizando `docker compose`.