# Proyecto numero 1 del curso de Redes

## Cómo correr el proyecto

- En Windows:
    1. Instalar Docker y Docker Compose, para esto se puede apoyar en la siguiente página: <https://docs.docker.com/get-docker/>
    2. Entrar a la carpeta del proyecto, en la consola de windows
    3. correr docker-compose up --build

- En linux:
    1. instalar docker
    2. instalar docker compose
    3. entrar a la carpeta y correr docker

## Pruebas que se pueden realizar para el programa

## Recomendaciones

1. Asegurarse de entender, almenos en un nivel superficial, lo que estas modificando antes de aceptarlo como un hecho o bien decir "asi funciona".

2. hacer las partes por aparte siguiendo las guias y verificar que funcionan con las configuraciones de las guias primero e ir progresivamente adaptandolo a las necesidades del proyecto

- Al trabajar con un proxy inverso y varios servidores, lo aconsejable es utilizar la misma tecnología, por ejemplo se utilizó nginx para el proxy reverso y también para los servidores.
  
- Al iniciar un servicio dentro de un contenedor basado en alguna distribución de linux, no se puede utilizar Systemctl, sino que lo que se recomienda es tener un archivo.sh, llamarlo después de iniciar el servicio, esto se hace con el comando ENTRYPOINT, dentro del archivo colocar /etc/init.d/[servicio a iniciar] y debajo de esa linea agregar tail -f /dev/null, con esto el servicio dentro del contendor iniciará correctamente.

1. Al trabajar con un proxy inverso y varios servidores, lo aconsejable es utilizar la misma tecnología, por ejemplo se utilizó nginx para el proxy reverso y también para los servidores.

2. Docker parece ser una tecnologia mas ampliamante utilizada que docker compose en si, para muchos casos si se quiere traducir una instruccion de docter a una estructura de docker compose se puede usar <https://www.composerize.com/>, esto tambien ayuda a entender mejor o visualizar lo que hace la instruccion traducida en cuestion.

3. Para la implementacion del vpn la imagen de <https://github.com/kylemanna> es muy muy popular y util.

4. Para entender que es lo que hace cada parte de la configuracion de los VPNs es muy util visiar la documentacion que OpenVpn tiene al respecto en <https://github.com/OpenVPN/openvpn/blob/master/sample/sample-config-files/server.conf>.

5. usar centos para los routers

6. a
7. b
8.  c

## Conclusiones
