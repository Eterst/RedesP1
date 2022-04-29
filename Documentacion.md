# Proyecto #1 de Redes

## <font size="6">Cómo correr el proyecto</font>

### <font size="5">**En Windows**</font>

1. Instalar Docker y Docker Compose, para esto se puede apoyar en la siguiente página: <https://docs.docker.com/desktop/windows/install/>
    - Puede descargar el ejecutable que incluye Docker y Docker Compose en: <https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe>
2. Entrar a la carpeta del proyecto, utilizando la consola de windows y el comando 'cd' desplazarse en los directorios del sistema hasta encontrar la carpeta donde se encuentra el proyecto, también se puede utilizar la dirección completa del archivo.
3. Una vez se tiene la consola ubicada dentro de la dirección del proyecto utilizar el comando:  

    - ```bash
      docker-compose up --build
      ```

    - Algunas veces en Windows es necesario añadir manualmente la carpeta de \Docker\resources\bin a la
      variable de entorno PATH para que reconozca el comando ***docker-compose***.

### <font size="5">**En linux**</font>

#### <font size="4">**Configurar repositorio:**</font>

1. Actualizar la lista de paquetes con:

    - ```bash
      sudo apt-get update
      ```

2. Permitir apt usar un repositorio por medio de HTTPS

    - ```bash
      sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
      ```

3. Añadir la llave oficial GPG de Docker
   - ```curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg```
4. Configurar la rama stable del Repositorio:

    - ```bash
      echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      ```

#### <font size="4">**Instalar Docker Engine:**</font>

1. Instalamos la última versión de Docker Engine, containerd y Docker Compose:

    - ```bash
      sudo apt-get update && \
      sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
      ```

#### <font size="4">**Instalar Docker Compose:**</font>

1. Usamos este comando para descargar la ultima versión estable de Docker Compose:

    - ```bash
      DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} && \
      mkdir -p $DOCKER_CONFIG/cli-plugins && \
      curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o && \
      $DOCKER_CONFIG/cli-plugins/docker-compose
      ```

2. Damos permisos para ejecutar el instalador:

    - ```bash
      chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
      ```

3. Probamos la instalación con:

    - ```bash
      docker compose version
      ```

#### <font size="4">**Iniciar Docker Compose:**</font>

  1. Entramos en la carpeta con el archivo *docker-compose.yaml* y ejecutamos el comando:

      - ```bash
        docker-compose up --build
        ```

## **Pruebas que se pueden realizar para el programa**

1. Para iniciar todos los contenedores:
    - Primero se ingresa a la carpeta donde está el proyecto

    - Se abre una consola dentro de la carpeta, también se puede utilizar la terminal de un IDE como Visual Studio Code.
  
    - Dentro de la terminal ingresar el comando para iniciar y observar la consola:

      ```bash
      docker-compose up --build
      ```

    - O usar el siguiente comando solo para iniciar:

       ```bash
       docker-compose up -d --build
       ```

    - Con el comando

      ```bash
      docker ps
      ```

      O observando los contenedores en la aplicación docker desktop, verificar que la inicialización de todas las partes del proyecto se complete exitosamente.

2. Pruebas del Router 1 (Con consola dentro del cliente 1):
    - Se entra al Cliente 1 por medio de:

      ```bash
      docker exec -it <id_contenedor> bash
      ```

      Donde el **<id_contenedor>** es el id del cliente al hacer el siguiente comando:

      ```bash
      docker ps
      ```

    - Al entrar en el contenedor usamos el siguiente comando para ver la ruta de los paquetes:

      ```bash
      traceroute www.google.com
      ```

        - Se prueba que el 1 sea el IP 10.0.0.10 que es el ip del Router 1
        - Se prueba que el 2 sea el Gateway de la red Bridge con el host
        - Se prueba la conexión a internet, asegurando que el paquete llega a www.google.com

3. Pruebas del Router 2 (Con consola dentro del cliente 2):
    - Se entra al Cliente 2 por medio de:

      ```bash
      docker exec -it <id_contenedor> bash
      ```

      Donde el **<id_contenedor>** es el id del cliente al hacer el siguiente comando:

      ```bash
      docker ps
      ```

    - Al entrar en el contenedor usamos el siguiente comando para ver la ruta de los paquetes:

      ```bash
      traceroute www.google.com
      ```

        - Se prueba que el 1 sea el IP 10.0.1.2 que es el ip del Router 2
        - Se prueba que el 2 sea el IP 10.0.0.10 que es el ip del Router 1
        - Se prueba que el 3 sea el Gateway de la red Bridge con el host
        - Se prueba la conexión a internet, asegurando que el paquete llega a www.google.com

## **Recomendaciones**

1. Asegurarse de entender, al menos en un nivel superficial, lo que estás modificando antes de aceptarlo como un hecho o bien decir "así funciona".

2. Al seguir una guía para la implementación de una parte de la red intentar implementar las partes en proyectos independientes que imitan el ambiente de la guía para probar y entender mejor su comportamiento para verificar que funcionan con las configuraciones mostradas primero e ir progresivamente adaptándolo a las necesidades del proyecto.

3. Al trabajar con un proxy inverso y varios servidores, lo aconsejable es utilizar la misma tecnología, por ejemplo se utilizó nginx para el proxy reverso y también para los servidores.

4. Docker parece ser una tecnología más ampliamente utilizada que docker compose en sí, para muchos casos si se quiere traducir una instrucción de docter a una estructura de docker compose se puede usar <https://www.composerize.com/>, esto también ayuda a entender mejor o visualizar lo que hace la instrucción traducida en cuestión.

5. Para la implementación del vpn la imagen de <https://github.com/kylemanna> es muy muy popular y útil.

6. Para entender que es lo que hace cada parte de la configuración de los VPNs es muy útil visitar la documentación que OpenVpn tiene al respecto en <https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/server.conf>.

7. Cuando se usa ubuntu como contenedor de docker se puede llegar a algunos problemas con systemd que es un conjunto de daemons del sistema e incluso algunas utilidades como sysctl, una forma de solucionar estos problemas es usando una imagen de CentOS en lugar de una de ubuntu, CentOS es muy similar a Ubuntu y en la mayoría de los casos hay pocas modificaciones con respecto a ubuntu, por esto es recomendado usar CentOS para imagen base a configurar en lugar de Ubuntu.

8. Al crear el router no hay que olvidarse de habilitar la NAT en todo el tráfico de red ya que si no lo habilitamos y hacemos pruebas con traceroute los paquetes aunque pasarán por el router no llegarán a ningúna parte, esto puede hacer que estemos horas viendo que está pasando pensando en cosas más complicadas cuando el error es algo simple.

9. Es recomendable el uso de los volúmenes en docker compose para copiar configuraciones dentro de los contenedores, esto ayuda crear el archivo y la carpeta en caso de que no exista, además nos saltamos dolores de cabeza relacionados a los permisos.

10. Para utilizar algún servicio interno como es el dhcp o dns dentro de la red, hay que desactivar el de docker, ya que sino docker por ejemplo asignará una ip automaticamente aunque ya hubiesemos creado el dhcp aparte, por lo tanto hay que desactivar estas configuraciones.

## **Conclusiones**

1. Al trabajar con un proxy inverso y varios servidores, lo aconsejable es utilizar la misma tecnología, por ejemplo se utilizó nginx para el proxy reverso y también para los servidores.

2. Al iniciar un servicio dentro de un contenedor basado en alguna distribución de linux, no se puede utilizar Systemctl, sino que lo que se recomienda es tener un archivo.sh, llamarlo después de iniciar el servicio, esto se hace con el comando ENTRYPOINT, dentro del archivo colocar /etc/init.d/[servicio a iniciar] y debajo de esa línea agregar tail -f /dev/null, con esto el servicio dentro del contenedor iniciará correctamente.

3. Las diferencias más importantes entre TCP y UDP vienen a ser la necesidad de establecer una necesidad antes de enviar información que existe en TCP y la bajo overhead o carga adicional que existe en UDP con el costo de no contar con algunas funcionalidades útiles cuando se trata con conexiones inestables.

4. Docker Compose es una gran herramienta para facilitar la coordinación de proyectos usando múltiples contenedores que se comportan de manera similar a máquinas virtuales, una de las grandes ayudas que el mismo proporciona es la implementación de la capa de enlace bridge que redirige el tráfico de red al host de manera que si queremos restringir el acceso a la red de Docker podemos hacerlo desde el Host.

5. Se profundizó el entendimiento de los servicios de red gracias a que se tuvieron que realizar configuraciones manuales las cuales ayudaron a profundizar el conocimiento de cómo es que funcionan estas herramientas.

6. En una red existen muchas dependencias entre cada dispositivo que se pueden volver molestas a la hora de desarrollar una lan personal en docker-compose, siempre se puede aprovechar de servicios públicos como el DNS de google o de OpenVPN, pero en caso de querer desarrollar todo el sistema es importante mantener un orden de operación para reducir la cantidad de tiempo que existe entre el desarrollo de una parte de la red y el momento en que esta parte se puede probar y debuggear de ser necesario.

7. Docker facilita muchas cosas a la hora de levantar un servicio, pero antes de comenzar a trabajar con docker, se necesita leer bastante la documentación y ver bastante información de cómo es que trabaja y que ofrece.

8. Si se trabaja cada contenedor con un dockerFile es posible modularizar el proyecto y utilizar el dockerFile para agregar comandos y otros útiles necesarios para la configuración y la ejecución del contenedor en el ambiente.

9. En gran parte de las ocasiones es mejor utilizar una imagen "vacía" como ubuntu, y luego instalar las herramientas que necesitemos, en especial en un ambiente educativo, ya que con una imagen vacía aprendemos a profundidad la herramienta que usaremos.

10. A la hora de estimar el tiempo que tomará realizar un trabajo a la hora de delegarlo a una parte de un grupo es importante tener en consideración no solo la carga en código sino que también la carga investigativa y la cantidad de dependencias que conlleva ese trabajo, en muchos casos es muy útil llevar un repositorio de enlaces ya sea de documentación, de stackoverflow o artículos para compartir y apoyarse a finalizar más rápidamente la carga investigativa.
