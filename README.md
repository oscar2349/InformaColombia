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


Ejemplo para la creacion de un Usuario

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

- Roles y permisos de Ususario (`http://localhost:8080/api/users`)


### Crear Tarea (`POST`  `http://localhost:8080/api/tasks)


Ejemplo para creacion de una tarea
**Body:**
```json
{
  "titulo": "Tarea de prueba",
  "descripcion": "Implementar paginación",
  "estado": "EN_PROGRESO",
  "fechaCreacion": "2025-06-19T10:00:00",
  "usuario": {
    "id": 2
  }
}

```

### Ejemplo Respuesta Paginator, Filtro y ordenado (`POST`  `http://localhost:8080/api/tasks/page/0?size=10&sortBy=titulo&direction=desc)


Ejemplo Response Paginator Tasks


**Body:**
```json
{
    "contenido": [
        {
            "id": 15,
            "titulo": "Test de integración",
            "descripcion": "Cobertura para flujos completos de usuario.",
            "fechaCreacion": "2025-06-18T18:28:08",
            "estado": "PENDIENTE",
            "usuarioId": 3
        },
        {
            "id": 22,
            "titulo": "Tarea de prueba",
            "descripcion": "Implementar paginación",
            "fechaCreacion": "2025-06-19T10:00:00",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 23,
            "titulo": "Tarea de prueba",
            "descripcion": "Implementar paginación",
            "fechaCreacion": "2025-06-19T10:00:00",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 24,
            "titulo": "Tarea de prueba",
            "descripcion": "Implementar paginación",
            "fechaCreacion": "2025-06-19T10:00:00",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 25,
            "titulo": "Tarea de prueba",
            "descripcion": "Implementar paginación",
            "fechaCreacion": "2025-06-19T10:00:00",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 26,
            "titulo": "Tarea de prueba",
            "descripcion": "Implementar paginación",
            "fechaCreacion": "2025-06-19T10:00:00",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 27,
            "titulo": "Tarea de prueba",
            "descripcion": "Implementar paginación",
            "fechaCreacion": "2025-06-19T10:00:00",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 9,
            "titulo": "Revisión de código",
            "descripcion": "Revisar PR #42 en GitHub.",
            "fechaCreacion": "2025-06-18T18:28:08",
            "estado": "EN_PROGRESO",
            "usuarioId": 3
        },
        {
            "id": 2,
            "titulo": "Revisar incidencias",
            "descripcion": "Revisión del backlog de bugs reportados por QA.",
            "fechaCreacion": "2025-06-18T18:28:08",
            "estado": "EN_PROGRESO",
            "usuarioId": 2
        },
        {
            "id": 5,
            "titulo": "Reunión con cliente",
            "descripcion": "Agendada para el martes a las 10 AM.",
            "fechaCreacion": "2025-06-18T18:28:08",
            "estado": "EN_PROGRESO",
            "usuarioId": null
        }
    ],
    "pagina": 0,
    "tamanio": 10,
    "totalElementos": 26,
    "totalPaginas": 3,
    "ultima": false
}

```

Ejemplo Response pageable usuarios (http://localhost:8080/api/users/page/0)


**Body:**
```json
{
    "content": [
        {
            "id": 2,
            "name": "Juan",
            "lastname": "Pérez",
            "email": "juan.perez@example.com",
            "username": "admin",
            "password": "$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS",
            "roles": [
                {
                    "id": 1,
                    "name": "ROLE_ADMIN"
                },
                {
                    "id": 2,
                    "name": "ROLE_USER"
                }
            ]
        },
        {
            "id": 3,
            "name": "Eduardo",
            "lastname": "Lopez",
            "email": "eduardo1@gmail.com",
            "username": "Eduardo1",
            "password": "$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS",
            "roles": [
                {
                    "id": 2,
                    "name": "ROLE_USER"
                }
            ]
        },
        {
            "id": 4,
            "name": "Maria",
            "lastname": "Perez",
            "email": "maria2@gmail.com",
            "username": "Maria2",
            "password": "$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS",
            "roles": []
        },
        {
            "id": 5,
            "name": "Juan",
            "lastname": "Rodriguez",
            "email": "juan3@gmail.com",
            "username": "Juan3",
            "password": "$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS",
            "roles": []
        }
    ],
    "pageable": {
        "pageNumber": 0,
        "pageSize": 4,
        "sort": {
            "empty": true,
            "sorted": false,
            "unsorted": true
        },
        "offset": 0,
        "unpaged": false,
        "paged": true
    },
    "last": false,
    "totalElements": 57,
    "totalPages": 15,
    "first": true,
    "size": 4,
    "number": 0,
    "sort": {
        "empty": true,
        "sorted": false,
        "unsorted": true
    },
    "numberOfElements": 4,
    "empty": false
}
```

