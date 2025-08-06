# 🏁 Need For Speed: Underground - Servidor Privado

Este proyecto ofrece una implementación de un servidor privado para el videojuego **Need for Speed: Underground**, permitiendo a los jugadores crear y unirse a partidas en línea de forma independiente.

## 📜 Descripción General

El servidor fue desarrollado inicialmente por **3 PriedeZ** y ha sido mantenido y mejorado por la comunidad. Es compatible exclusivamente con la primera entrega de **Need for Speed: Underground**, y no con su secuela.

El proyecto se compone de tres partes principales:

- **nfsuserver**: El núcleo del servidor, encargado de gestionar las partidas, los jugadores y la comunicación con los clientes.
- **nfsuclient**: Una aplicación cliente que facilita la conexión al servidor privado, modificando la configuración del juego para redirigir el tráfico de red.
- **web**: Un conjunto de scripts PHP que proporcionan una interfaz web para monitorizar el estado del servidor, ver estadísticas de los jugadores y listar los servidores disponibles.

## 🚀 Guía de Instalación y Configuración

A continuación se detalla el proceso de instalación, configuración y despliegue de cada uno de los componentes del proyecto.

### 🖥️ Servidor (nfsuserver)

El servidor es el componente central que permite el juego en línea. Puede ser compilado y ejecutado tanto en sistemas operativos Linux como Windows.

#### Compilación

##### Linux

Para compilar el servidor en un entorno Linux, es necesario tener instaladas las herramientas de desarrollo básicas.

```bash
sudo apt-get update
sudo apt-get install git make build-essential
```

Una vez instaladas las dependencias, clona el repositorio y compila el proyecto:

```bash
git clone https://github.com/HarpyWar/nfsuserver.git
cd nfsuserver/nfsuserver
make
```

Tras la compilación, se generará un ejecutable llamado `nfsuserver` en el mismo directorio.

##### Windows

Para compilar el servidor en Windows, es necesario tener instalado **Visual Studio** junto con el **Windows SDK**.

1.  Abre el archivo de la solución `nfsuserver.sln` con Visual Studio.
2.  Si deseas compilar el servidor para que se ejecute como un servicio de Windows, descomenta la bandera `NT_SERVICE` en el archivo `win_nix.h`.
3.  Compila la solución. Se generarán dos ejecutables: `nfsuserver.exe` (aplicación de consola) y `nfsuserver_svc.exe` (servicio de Windows).

#### Configuración

La configuración del servidor se realiza a través de dos archivos principales:

-   **nfsu.conf**: Contiene los parámetros de configuración del servidor.
-   **news.txt**: Contiene el mensaje de bienvenida que se muestra a los jugadores al unirse al servidor.

##### Parámetros de `nfsu.conf`

A continuación se describen los parámetros de configuración disponibles en el archivo `nfsu.conf`:

-   `servername`: El nombre del servidor que se mostrará en el cliente.
-   `serverip`: La dirección IP en la que el servidor escuchará las conexiones. Por defecto, `0.0.0.0` (todas las interfaces).
-   `serverexternalip`: La dirección IP externa del servidor. Es necesario configurarla si el servidor se encuentra detrás de un NAT.
-   `welcomemessage`: El mensaje de bienvenida que se muestra a los jugadores.
-   `enablelogfile`: Habilita o deshabilita el registro de eventos en el archivo `server.log`.
-   `rewritelogfile`: Si está habilitado, el archivo de log se borrará cada vez que se inicie el servidor.
-   `registerglobal`: Habilita o deshabilita el registro del servidor en la lista pública de servidores.
-   `disabletimestamp`: Excluye la marca de tiempo de los registros de log.
-   `verbose`: Habilita el registro de eventos detallado.
-   `logalltraffic`: Registra todo el tráfico de red en un archivo separado.
-   `banv1`, `banv2`, `banv3`, `banv4`: Permiten prohibir la conexión de clientes con versiones específicas del juego.
-   `banroomscreation`: Impide que los usuarios creen sus propias salas de juego.
-   `bancheater`: Impide la entrada de jugadores detectados como tramposos.
-   `rooms_ranked_circuit`, `rooms_ranked_sprint`, `rooms_ranked_drift`, `rooms_ranked_drag`: Define los nombres de las salas para las partidas clasificatorias de cada modo de juego.
-   `rooms_unranked_circuit`, `rooms_unranked_sprint`, `rooms_unranked_drift`, `rooms_unranked_drag`: Define los nombres de las salas para las partidas no clasificatorias de cada modo de juego.

#### Ejecución

##### Linux

Para ejecutar el servidor en Linux, simplemente ejecuta el binario compilado:

```bash
./nfsuserver
```

##### Windows

-   **Modo de consola**: Ejecuta `nfsuserver.exe`.
-   **Modo de servicio**: Para instalar, iniciar y desinstalar el servicio, utiliza los siguientes comandos:
    ```bash
    nfsuserver_svc.exe -i  # Instalar el servicio
    net start NFSU:LAN     # Iniciar el servicio
    net stop NFSU:LAN      # Detener el servicio
    nfsuserver_svc.exe -u  # Desinstalar el servicio

### 🚗 Cliente (nfsuclient)

El cliente es una aplicación de Windows que facilita la conexión al servidor privado.

#### Compilación

Para compilar el cliente, es necesario tener instalado **Visual Studio**.

1.  Abre el archivo de la solución `nfsuclient.sln` con Visual Studio.
2.  Compila la solución. Se generará un ejecutable llamado `nfsuclient.exe`.

#### Configuración y Uso

1.  Ejecuta `nfsuclient.exe`.
2.  La aplicación detectará automáticamente los servidores disponibles en la red local. También puedes añadir servidores manualmente o obtener una lista de servidores públicos.
3.  Selecciona un servidor de la lista y haz clic en **Use Server**.
4.  La aplicación modificará el archivo `hosts` de tu sistema para redirigir el tráfico del juego al servidor seleccionado.
5.  Inicia el juego, ve a la sección **Play Online** y crea un nuevo perfil.

### 🌐 Componentes Web

El proyecto incluye un conjunto de scripts PHP que proporcionan una interfaz web para el seguimiento y monitoreo de servidores.

#### Configuración

Para que los componentes web funcionen correctamente, es necesario tener un servidor web con soporte para PHP.

1.  Copia los directorios `monitoring`, `stats` y `tracker` a la raíz de tu servidor web.
2.  Asegúrate de que el servidor web tenga permisos de escritura sobre el archivo `tracker/servers.txt`.
3.  Configura la dirección IP y el puerto del servidor en los siguientes archivos:
    -   `stats/index.php`: Modifica las variables `$server_ip` y `$server_port`.
    -   `monitoring/nfsu_monitoring.php`: Modifica las variables `$server['ip']` y `$server['port']`.

## 🚀 Despliegue y Mantenimiento

Para asegurar un funcionamiento óptimo y continuo del servidor, se recomienda seguir las siguientes prácticas de despliegue y mantenimiento.

### Despliegue

1.  **Servidor**: Despliega el servidor en una máquina con una conexión a Internet estable y de baja latencia. Si el servidor se encuentra detrás de un NAT, asegúrate de configurar correctamente el parámetro `serverexternalip` en `nfsu.conf` y de redirigir los puertos necesarios en tu router.
2.  **Componentes Web**: Despliega los componentes web en un servidor web accesible públicamente para que los jugadores puedan ver las estadísticas y la lista de servidores.

### Mantenimiento

-   **Logs**: Revisa periódicamente los archivos de log (`server.log` y `traffic.log`) para detectar posibles errores o actividades sospechosas.
-   **Actualizaciones**: Mantén el servidor y los componentes web actualizados con las últimas versiones del repositorio para beneficiarte de las últimas mejoras y correcciones de seguridad.
-   **Copias de seguridad**: Realiza copias de seguridad periódicas de los archivos de configuración y de la base de datos de usuarios (`rusers.dat`).
