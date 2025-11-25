# Modernización del Proceso On-Premises a Azure

Basado en el enunciado del Caso de Uso (páginas 3–4 del PDF) 

## Problemas del modelo actual
- Procesos desacoplados y manuales (SSIS, Python, Bot).
- Dependencia total del Servidor X.
- Envío de archivos .json mediante bot → poco escalable.
- No existe gobierno ni versionamiento de datos.
- No existe arquitectura de lago de datos estándar.
- No existe integración nativa con nube.

---

## Arquitectura propuesta (Azure)

### Capas
- **Bronze (Raw)** → Storage Gen2  
  Datos crudos del API SUGEF y sistemas on-premise.

- **Silver (Cleansed)** → Databricks  
  Estandarización, validación y reglas de negocio.  
  Aquí se implementa **Data Vault (Hubs, Links, Satellites)**.

- **Gold (Business)** → Databricks  
  Métricas listas para consumo, modelos, KPIs.

### Orquestación
- **Azure Data Factory**  
  - Ingesta de archivos on-premise.  
  - Ejecución de notebooks Databricks.  
  - Llamadas al API SUGEF.

### Procesamiento
- **Azure Databricks**  
  - Limpieza de JSON.  
  - Aplicación de modelos.  
  - Conversión a formato Delta.

### API / Integración
- **API Management** (opcional)  
  Para exponer interfaz segura con Sistema Y.

---

## Recursos adicionales recomendados
- **Key Vault** → secretos, credenciales y tokens OAuth SUGEF.
- **Log Analytics** → monitoreo.
- **Event Grid / Webhooks** → automatización desde Sistema Y.
- **Azure Functions** → microprocesos ligeros.

---

## Innovaciones sugeridas
- Autoloader de Databricks para ingesta automática incremental.
- Delta Live Tables para pipelines declarativos.
- Implementar Data Quality (Expectations) en Silver.
- Eliminar Bots → usar APIs nativas o ADF REST.

