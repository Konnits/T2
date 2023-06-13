# Install Dependencies
```
npm install
```

# Install prisma
To run next line is necessary install prisma
```
npm install @prisma/client
```

# Migrate Database PRISMA
to migrate ORM Schema to a Database model type in console (remember change **.example.env** to **.env** and the parameters inside)
```
npx prisma migrate dev
```

# RUN
to run the project type in console
```
npm run dev
```

# Documentación de la API

## CRUD

### Personajes

#### (POST) Crear personaje - /api/personajes

Parámetros:

- nombre: varchar(45) (required)
- fuerza: integer (required)
- fecha_nacimiento: date (required)
- objeto: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/create_personajes.png)

#### (GET) Obtener personajes - /api/personajes

Si ningún parámetro es adjuntado, entonces se devolverán todos los personajes. Es posible utilizar el parámetro fuerza como un rango de enteros. Además es posible utilizar fecha_nacimiento como un rango de fechas escrito con "/".

Parámetros:

- nombre: varchar(45)
- fuerza: integer - range
- fecha_nacimiento: date - range
- objeto: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/get_personajes.png)

#### (PUT) Actualizar personaje - /api/personajes

Solo es necesario ingresar un Id válido, mientras que los parámetros que no sean proporcionados se mantendrán como antes.

Parámetros:

- id: integer (required)
- nombre: varchar(45)
- fuerza: integer - range
- fecha_nacimiento: date - range
- objeto: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/update_personajes.png)

#### (DELETE) Eliminar personajes - /api/personajes

Es necesario sólo ingresar la clave primaria del personaje.

Parámetros:

- id: integer (required)


![](https://github.com/Konnits/T2/blob/main/Images/delete_personajes.png)