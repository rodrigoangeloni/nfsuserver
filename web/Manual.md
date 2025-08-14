# Manual de instalación y uso de la web NFSU

## 1. Requisitos previos

- Servidor web con soporte PHP (Apache, Nginx, IIS, XAMPP, WampServer, etc.).
- Acceso al directorio raíz del servidor web.
- Archivos de la carpeta `web` del proyecto.

---

## 2. Instalación

### Windows (XAMPP/WampServer)

1. Instala XAMPP o WampServer.
2. Copia la carpeta `web` a la ruta:
   - XAMPP: `C:\xampp\htdocs\web`
   - WampServer: `C:\wamp\www\web`
3. Inicia Apache desde el panel de control de XAMPP/WampServer.

### Linux (Apache)

1. Instala Apache y PHP:
   ```bash
   sudo apt update
   sudo apt install apache2 php
   ```
2. Copia la carpeta `web` a:
   ```
   /var/www/html/web
   ```
3. Da permisos de lectura:
   ```bash
   sudo chmod -R 755 /var/www/html/web
   ```
4. Reinicia Apache:
   ```bash
   sudo systemctl restart apache2
   ```

---

## 3. Uso

### Acceso desde el navegador

- **Monitorización del servidor:**
  `http://localhost/web/monitoring/nfsu_monitoring.php`
- **Estadísticas:**
  `http://localhost/web/stats/index.php`
- **Tracker de servidores:**
  `http://localhost/web/tracker/get_list.php`

### Funcionalidad

- **monitoring/nfsu_monitoring.php:** Muestra el estado y estadísticas del servidor NFSU en tiempo real.
- **stats/index.php:** Presenta gráficos, rankings y estadísticas de partidas.
- **tracker/get_list.php:** Lista los servidores activos.
- **tracker/submit.php:** Permite registrar nuevos servidores (si está habilitado).

---

## 4. Configuración adicional

- Verifica que los scripts PHP tengan acceso a los datos del servidor NFSU (IP, puertos, archivos de log, etc.).
- Si necesitas personalizar rutas, credenciales o parámetros, edita los archivos PHP correspondientes.
- Para acceso externo, abre los puertos necesarios en el firewall y configura el router si es requerido.

---

## 5. Solución de problemas

- Si la web no carga, revisa que Apache/Nginx esté iniciado y que PHP esté instalado.
- Verifica permisos de archivos y carpetas.
- Consulta los logs de Apache (`error.log`) para detalles de errores.

---

Para dudas o soporte, consulta la documentación del servidor web o contacta al desarrollador del proyecto.
