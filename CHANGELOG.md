# CHANGELOG

## 2025-08-13

- Corrección de errores de sintaxis en archivos PHP (`stats/index.php`, `monitoring/nfsu_monitoring.php`).
- Actualización de IPs en scripts PHP para conexión correcta con el servidor NFSU.
- Eliminación de warnings por claves de array indefinidas usando `isset()` en los archivos PHP.
- Dockerización de la web: creación y ajuste de `Dockerfile` y `docker-compose.yml` para facilitar despliegue.
- Redirección automática en `index.php` para acceso rápido a estadísticas.
- Manual de instalación y uso agregado en `web/Manual.md`.
- Mejoras en la robustez del código PHP para evitar errores fatales y advertencias.
- Explicación y documentación de las secciones `stats`, `monitoring` y `tracker`.
