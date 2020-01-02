# fundamentos-base-de-datos
Prácticas de fundamentos de base de datos, conceptos básicos para manejarse por una base de datos. 


## Herramientes  

Yo he utilizo mysql, en concreto el fork de MarinaBD  

### Comandos para trabajar   

- Arrancar el servidor (este comando depende del sistema, en ubunto es service algo start) en mi versión de arch es:
`sudo systemctl start mysqld`

`mysqld_safe`
- Abrir sesión `sudo mysql -u root ` 

Dentro de aquí se puede cambiar la constraseña 


-  Creamos una base de datos en la que trabajar  
`CREATE DATABASE <nombre de la base de datos>;`

- Para usar una base de datos ya existente 
`USE <nombre de la base de datos > `

- Para listar todas las tablas de una base de datos usar: `SHOW FULL TABLES FROM fbd;`

### Interpretar una orden de un fichero .sql 



