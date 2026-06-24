# Innovatech - Fase 3: Escalabilidad y Orquestación Cloud 🚀

Este repositorio contiene el código fuente y la configuración del pipeline de Integración y Despliegue Continuo (CI/CD) para el microservicio de **Frontend** del proyecto Innovatech. La infraestructura está diseñada para operar de manera elástica, segura y con alta disponibilidad.

## 🏗️ Arquitectura de la Solución

La solución implementa una arquitectura serverless y automatizada utilizando los siguientes servicios de AWS:

* **AWS ECS (Elastic Container Service) con AWS Fargate:** Orquestación de contenedores sin gestión de servidores físicos.
* **Amazon ECR (Elastic Container Registry):** Almacenamiento y versionamiento privado de las imágenes Docker.
* **Application Load Balancer (ALB):** Distribución inteligente del tráfico externo hacia los contenedores activos.
* **AWS CloudWatch:** Centralización de métricas críticas y logs de auditoría del sistema.

---

## 🤖 Pipeline CI/CD (GitHub Actions)

El archivo de flujo de trabajo `.github/workflows/deploy.yml` automatiza el ciclo de vida del software cada vez que se realiza un `git push` a la rama principal. El pipeline ejecuta las siguientes etapas:

1.  **Aprovisionamiento de Credenciales:** Autenticación segura mediante secretos de GitHub utilizando el `LabRole` temporal de AWS Academy.
2.  **Build & Tag:** Compilación de la imagen Docker optimizada utilizando el Commit SHA como etiqueta única de trazabilidad.
3.  **Push a ECR:** Carga de la imagen construida hacia el registro privado en Amazon ECR.
4.  **Deploy en ECS:** Actualización del servicio en el clúster `default` aplicando una estrategia de despliegue progresivo (*Rolling Update*) con **cero tiempo de inactividad (Cero Downtime)**.

---

## 🔒 Variables de Entorno y Configuración del Entorno

Para la replicación y auditoría del despliegue, el pipeline utiliza las siguientes variables clave mapeadas en la infraestructura:

* **AWS_REGION:** `us-east-1`
* **ECS_CLUSTER:** `default`
* **ECS_SERVICE:** `innovatech-cluster-f190`
* **ECS_TASK_DEFINITION:** `innovatech-frontend-task`
* **CONTAINER_NAME:** `frontend-container`

---

## 📈 Resiliencia y Alta Disponibilidad

* **Service Auto Scaling:** Implementación de políticas de *Target Tracking* basadas en el consumo promedio de CPU al **50%**.
* **Health Checks Activos:** El balanceador valida el estado de salud del contenedor antes de redirigir el tráfico de producción, garantizando que los usuarios nunca experimenten caídas del servicio durante una actualización.
