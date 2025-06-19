# Gestion de tareas App

Aplicación full stack basada para gestionar tareas

## Tecnologías
- Angular
- Spring Boot
- MySQL
- JWT
- BcryptPassword
- Auth0 

## Esquema Base de Datos gestion Tareas

1. Tabla users
2. Tabla roles
3. Tabla user_roles
4. Tabla tareas

## Esquema Base de Datos gestion Roles y permisos

1. Tabla Roles
2. Tabla Usuarios Roles

### Despliegue

1. Crear la BDD en mi sql db_backend_users - usuario: root y pass: password
2. levantar o ejecutar el jar del backend de la carpeta target (java -jar users-backend-0.0.1-SNAPSHOT.jar)
   o desde visual studio code 
3. Levantar el front desde la carpeta FrontFinal\5-user-app ejecutar, ng serve -o, eso levantara el proyecto en http://localhost:4200/login



### Autenticación (`POST`  `http://localhost:8080/login`) Obtener el JWT

1. Primero crear la BDD con el esquema Sql, ella carga la data de prueba
2. Usar como usuario: admin y contraseña: 12345

**Body:**
```json
{
  "username": "admin",
  "password": "12345"
}
```
De esta manera retorna el token, se puede probar desde el Back


### Crear Usuario (`POST`  `http://localhost:8080/login`)


Authorization: bearer tokenJWT generado
**Body:**
```json
{
  "id": 1,
  "name": "Juan",
  "lastname": "Pérez",
  "email": "juan.perez@example.com",
  "username": "juan123",
  "password": "secreto123",
  "roles": [
    {
      "id": 1,
      "name": "ROLE_USER"
    },
    {
      "id": 2,
      "name": "ROLE_ADMIN"
    }
  ]
}

```
http://localhost:8080/api/users

- Roles y permisos de Ususario (`http://localhost:8080/api/users`)

## repositorio GitHub
- GitHub : https://github.com/oscar2349/InformaColombia
## Instrucciones



