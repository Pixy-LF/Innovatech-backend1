# 🚀 Innovatech - Sistema de Despacho Automatizado

Plataforma empresarial diseñada para la gestión, control y automatización de flujos de despacho. Este repositorio centraliza el entorno de desarrollo contenerizado, la gestión de versiones mediante Git Flow y la documentación técnica para el despliegue del sistema Innovatech.

---

## 🛠️ Estructura y Arquitectura del Proyecto

El ecosistema de **Innovatech** está compuesto por dos componentes principales que se comunican de forma desacoplada y una capa de persistencia de datos:

1. **📁 Carpeta Frontend (`Innovatech-frontend1`):** Interfaz gráfica de usuario interactiva montada sobre tecnologías web modernas, empaquetada de forma multietapa y servida eficientemente a través de un servidor proxy inverso con **Nginx** en el puerto `80`.
2. **📁 Carpeta Backend (`Springboot-API-REST-DESPACHO`):** API REST robusta construida con **Java 17 y Spring Boot**, encargada de la lógica de negocio de los despachos, expuesta en el puerto `8080`.
3. **🗄️ Base de Datos Relacional:** Gestionada mediante el motor **PostgreSQL 15 (Alpine)** en el puerto `5432`, conectada internamente con el backend mediante credenciales seguras.

---

## 🐳 Requisitos previos y Entorno Local

Para levantar y probar este proyecto en tu entorno local de desarrollo, necesitas tener instalados los siguientes componentes:

* [Docker Desktop] (https://www.docker.com/products/docker-desktop/) (Versión 20.10 o superior)
* [Git] (https://git-scm.com/)

### Instrucciones de Despliegue Rápido (Local)

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/tu-usuario/innovatech-project.git](https://github.com/tu-usuario/innovatech-project.git)
   cd innovatech-project
