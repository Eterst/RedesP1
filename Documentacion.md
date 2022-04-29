# Proyecto numero 1 del curso de Redes

## Cómo correr el proyecto

Para instalar docker y docker compose, se puede realizar de la siguiente página: <https://docs.docker.com/get-docker/>

- En windows:
    Instalar WSL
    Instalar Docker y Docker Compose
    Entrar a la carpeta del proyecto
    correr docker-compose up --build

- En linux:
    instalar docker
    instalar docker compose
    entrar a la carpeta y correr docker

## Pruebas que se pueden realizar para el programa

## Recomendaciones

- hacer las partes por aparte siguiendo las guias y verificar que funcionan con las configuraciones de las guias primero e ir progresivamente adaptandolo a las necesidades del proyecto

- Al trabajar con un proxy inverso y varios servidores, lo aconsejable es utilizar la misma tecnología, por ejemplo se utilizó nginx para el proxy reverso y también para los servidores.
  
- Al iniciar un servicio dentro de un contenedor basado en alguna distribución de linux, no se puede utilizar Systemctl, sino que lo que se recomienda es tener un archivo.sh, llamarlo después de iniciar el servicio, esto se hace con el comando ENTRYPOINT, dentro del archivo colocar /etc/init.d/[servicio a iniciar] y debajo de esa linea agregar tail -f /dev/null, con esto el servicio dentro del contendor iniciará correctamente.

## Conclusiones

- pueden usar <https://www.composerize.com/> con cuidado

- para el vpn la imagen de <https://github.com/kylemanna> es muy muy popular y util

- usar centos para los routers
