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

Para la realización de la tarea, se hicieron 2 supuestos:

- La relación entre **reinos** y **defensas** es de muchos a muchos, por lo que se implementó una nueva tabla **reino_tiene_defensa**.
- Por dificultades para almacenar el parámetro de **fecha_registro** de la tabla **personaje_habita_reino**, se definió esta columna como una que almacena el instante en el cual se ingresa el registro en la tabla. La justificación de esto es que no se hace mención a su significado, por lo que podemos hacer esto sin salirnos de lo establecido en la tarea.

## EndPoints

Se solicitó la implementación de 4 EndPoints a parte de los **CRUD**. A continuación se especifica su utilización.

### (GET) /api/top5personajesConMasFuerza

Con esta ruta se puede obtener un listado de a lo más 5 personajes que poseen más fuerza. No tiene parámetros.

![](https://github.com/Konnits/T2/blob/main/Images/top5personajesconmasfuerza.png)

### (GET) /api/personajeConMasKarts

Con esta ruta se puede obtener el personaje que más autos posee.

![](https://github.com/Konnits/T2/blob/main/Images/personajeconmaskarts.png)

### (GET) /api/cantidadHabitantes/<id_reino>

Con esta ruta se puede obtener la cantidad de personajes que posee un reino, para lo cual el parámetro **id_reino** es necesario.

![](https://github.com/Konnits/T2/blob/main/Images/cantidadhabitantes.png)

### (GET) /api/gobernante/<id_reino>

Con esta ruta se puede obtener un listado de los personajes que son gobernantes de un reino específico. Cuando este parámetro no se especifica, entonces se retornan todos los personajes que son gobernantes de algún reino.

![](https://github.com/Konnits/T2/blob/main/Images/gobernante.png)

## CRUD

### Personajes

#### (POST) Crear personaje - /api/personajes

Parámetros:

- nombre: varchar(45) (required)
- fuerza: integer (required)
- fecha_nacimiento: date (required)
- objeto: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/create_personajes.png)

-----

#### (GET) Obtener personajes - /api/personajes

Si ningún parámetro es adjuntado, entonces se devolverán todos los personajes. Es posible utilizar el parámetro fuerza como un rango de enteros. Además es posible utilizar fecha_nacimiento como un rango de fechas escrito con "/".

Parámetros:

- nombre: varchar(45)
- fuerza: integer - range
- fecha_nacimiento: date - range
- objeto: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/get_personajes.png)

-----

#### (PUT) Actualizar personaje - /api/personajes

Solo es necesario ingresar un Id válido, mientras que los parámetros que no sean proporcionados se mantendrán como antes.

Parámetros:

- id: integer (required)
- nombre: varchar(45)
- fuerza: integer - range
- fecha_nacimiento: date - range
- objeto: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/update_personajes.png)

-----

#### (DELETE) Eliminar personajes - /api/personajes

Es necesario sólo ingresar la clave primaria del personaje.

Parámetros:

- id: integer (required)


![](https://github.com/Konnits/T2/blob/main/Images/delete_personajes.png)

-----

### Trabajos

#### (POST) Crear trabajo - /api/trabajos

Parámetros:

- descripcion: varchar(45) 
- sueldo: integer (required)

![](https://github.com/Konnits/T2/blob/main/Images/create_trabajos.png)

-----

#### (GET) Obtener trabajos - /api/trabajos

Si ningún parámetro es adjuntado, entonces se devolverán todos los personajes. Es posible utilizar el parámetro fuerza como un rango de enteros. Además es posible utilizar fecha_nacimiento como un rango de fechas escrito con "/".

Parámetros:

- descripcion: varchar(45) 
- sueldo: integer 

![](https://github.com/Konnits/T2/blob/main/Images/get_trabajos.png)

-----

#### (PUT) Actualizar trabajos - /api/trabajos

Solo es necesario ingresar un Id válido, mientras que los parámetros que no sean proporcionados se mantendrán como antes.

Parámetros:

- descripcion: varchar(45) 
- sueldo: integer 

![](https://github.com/Konnits/T2/blob/main/Images/update_trabajos.png)

-----

#### (DELETE) Eliminar trabajos - /api/trabajos

Es necesario sólo ingresar la clave primaria del trabajo.

Parámetros:

- id: integer (required)


![](https://github.com/Konnits/T2/blob/main/Images/delete_trabajos.png)

-----

### Personaje_tiene_trabajo

#### (POST) Crear personaje trabajador - /api/personaje_tiene_trabajo

Para asignar un trabajo a un personaje se requieren los parámetros que se señalan a continuación. Fecha de término es un posible valor NULL

Parámetros:

- id_trabajo: integer (required)
- id_personaje: integer (required)
- fecha_inicio: date (required) 
- fecha_termino: date 

![](https://github.com/Konnits/T2/blob/main/Images/create_personaje_tiene_trabajo.png)

-----

#### (GET) Visualizar personaje trabajador - /api/personaje_tiene_trabajo

Si ningún parámetro es adjuntado, entonces se devolverán todos los personajes que tienen trabajo.

Parámetros:

- id_trabajo: integer 
- id_personaje: integer 
- fecha_inicio: date  
- fecha_termino: date 

![](https://github.com/Konnits/T2/blob/main/Images/get_personaje_tiene_trabajo.png)

-----

#### (PUT) Actualizar personaje trabajador - /api/personaje_tiene_trabajo

Solo es necesario ingresar un Id válido de trabajo y un Id válido de personaje, además de algún parámetro a actualizar, mientras que los parámetros que no sean proporcionados se mantendrán como antes.

Parámetros:

- id_trabajo: integer (required)
- id_personaje: integer (required)
- fecha_inicio: date 
- fecha_termino: date 

![](https://github.com/Konnits/T2/blob/main/Images/update_personaje_tiene_trabajo.png)

-----

#### (DELETE) Borrar personaje trabajador - /api/personaje_tiene_trabajo

Solo es necesario ingresar un Id válido de trabajo y un Id válido de personaje para descartar toda la información asociada al trabajo de un personaje.

Parámetros:

- id_trabajo: integer (required)
- id_personaje: integer (required)

![](https://github.com/Konnits/T2/blob/main/Images/delete_personaje_tiene_trabajo.png)

-----

### Karts

#### (POST) Crear automovil - /api/karts

Para crear un automovil es necesario contar con su modelo y color, pudiendo no incluir información de su velocidad máxima o pudiendo no tener dueño/a

Parámetros:

- modelo: varchar(45) (required)
- color: varchar(45) (required)
- velocidad_maxima: integer 
- id_personaje: integer 

![](https://github.com/Konnits/T2/blob/main/Images/create_karts.png)

-----

#### (GET) Obtener automovil - /api/karts

Si ningún parámetro es adjuntado, entonces se devolverán todos los automóviles.

Parámetros:
- id: integer
- modelo: varchar(45) 
- color: varchar(45) 
- velocidad_maxima: integer 
- id_personaje: integer 

![](https://github.com/Konnits/T2/blob/main/Images/get_karts.png)

-----

#### (PUT) Actualizar automovil - /api/karts

Para actualizar la información un automovil es necesario contar con su Id y la caracteristica a actualizar.

Parámetros:

- id: integer (required)
- modelo: varchar(45) 
- color: varchar(45) 
- velocidad_maxima: integer 
- id_personaje: integer 

![](https://github.com/Konnits/T2/blob/main/Images/update_karts.png)

-----


#### (DELETE) Eliminar automovil - /api/karts

Para eliminar un automóvil solo hace falta facilitar su Id.

Parámetros:

- id: integer

![](https://github.com/Konnits/T2/blob/main/Images/delete_karts.png)

-----

### Reinos

#### (POST) Crear reino - /api/reinos

Para crear un reino es necesario proporcionar nombre del reino, ubicación y superficie.

Parámetros:

- nombre: varchar(45) (required)
- ubicación: varchar(45) (required)
- superficie: integer (required)

![](https://github.com/Konnits/T2/blob/main/Images/create_reinos.png)

-----

#### (GET) Obtener reino - /api/reinos

Para obtener un reino se pueden facilitar cualquiera de sus parámetros, mientras que si no se coloca ningun parámetro se devolveran todos los reinos,

Parámetros:

- id: integer 
- nombre: varchar(45) 
- ubicación: varchar(45) 
- superficie: integer 

![](https://github.com/Konnits/T2/blob/main/Images/get_reinos.png)

-----

#### (PUT) Actualizar reino - /api/reinos

Para actualizar la información un reino es necesario contar con su Id y la/las caracteristica/s a actualizar.

Parámetros:

- id: integer (required)
- nombre: varchar(45) 
- ubicación: varchar(45) 
- superficie: integer 

![](https://github.com/Konnits/T2/blob/main/Images/update_reinos.png)

-----

#### (DELETE) Borrar reino - /api/reinos

Para eliminar un reino es necesario aportar su Id.

Parámetros:

- id: integer (required) 

![](https://github.com/Konnits/T2/blob/main/Images/delete_reinos.png)

-----

### Personaje_habita_reino

#### (POST) Crear personaje habitante de un pueblo - /api/personaje_habita_reino

Para crear o registrar una persona dentro de un reinos, es necesario proporcionar Id del personaje, Id del reino y si es o no gobernante del reino. Mientras que la fecha de registro se colocará como la fecha cuando se registra el dato en el sistema, no debe ser proporcionado.

Parámetros:

- id_personaje: integer (required)
- id_reino: integer (required)
- es_gobernante: boolean (required)

![](https://github.com/Konnits/T2/blob/main/Images/create_personaje_habita_reino.png)

-----

#### (GET) Obtener personaje de un reino - /api/personaje_habita_reino

Para obtener un habitante de un reino se pueden facilitar cualquiera de sus parámetros, mientras que si no se coloca ningun parámetro se devolveran todos habitantes de todos los reinos.

Parámetros:

- id_personaje: integer 
- id_reino: integer 
- fecha_registro: timestamp
- es_gobernante: boolean 

![](https://github.com/Konnits/T2/blob/main/Images/get_personaje_habita_reino.png)

-----


#### (PUT) Actualizar personajes de un reino - /api/personaje_habita_reino

Para actualizar un registro debemos proporcionar Id del personaje, Id del reino y la caracteristica a actualizar

Parámetros:

- id_personaje: integer (required)
- id_reino: integer (required)
- es_gobernante: boolean 

![](https://github.com/Konnits/T2/blob/main/Images/update_personaje_habita_reino.png)

-----

#### (DELETE) Borrar personaje perteneciente a un reino - /api/personaje_habita_reino

Para eliminar un personaje de un reino es necesario aportar Id del personaje e Id del reino.

Parámetros:

- id_personaje: integer (required)
- id_reino: integer (required)

![](https://github.com/Konnits/T2/blob/main/Images/delete_personaje_habita_reino.png)

-----

### Defensas

#### (POST) Crear defensas - /api/defensas

Para crear una defensa es necesario proporcionar la descripción de la defensa.

Parámetros:

- defensa: varchar(45) (required)

![](https://github.com/Konnits/T2/blob/main/Images/create_defensas.png)

-----

#### (GET) Obtener defensas - /api/defensas

Para obtener las defensas se puede especificar algunos de los parámetros o bien, no proporcionarlos para así obtener el registro completo de las defensas.

Parámetros:

- id: integer
- defensa: varchar(45)

![](https://github.com/Konnits/T2/blob/main/Images/get_defensas.png)

-----


#### (PUT) Actualizar defensas - /api/defensas

Para actualizar un registro debemos proporcionar Id de la defensa, para así poder actualizar la defensa. Al ser el único parámetro actualizable, es obligatorio.

Parámetros:

- id: integer (required)
- defensa: varchar(45) (required)

![](https://github.com/Konnits/T2/blob/main/Images/update_defensas.png)

-----

#### (DELETE) Borrar defensas - /api/defensas

Para eliminar una defensa es necesario contar con su id.

Parámetros:

- id: integer (required)

![](https://github.com/Konnits/T2/blob/main/Images/delete_defensas.png)

-----

### Reino_tiene_defensas

#### (POST) Crear reino_tiene_defensa - /api/reino_tiene_defensa

Para asignarle una defensa a un reino en particular es necesario tener id_reino, id_defensa y cantidad, la cual indica cuántas de dicha defensa posee dicho reino.

Parámetros:

- id_reino: int (required)
- id_defensa: int (required)
- cantidad: int (required)

![](https://github.com/Konnits/T2/blob/main/Images/create_reino_tiene_defensa.png)

-----

#### (GET) Obtener reino_tiene_defensa - /api/reino_tiene_defensa

Se puede obtener la totalidad de las defensas que son poseidas por algún reino, al no colocar ningún parámetro en la petición, por otro lado, cualquier parámetro que se agregue, filtrará los datos.

Parámetros:

- id_reino: int
- id_defensa: int
- cantidad: int

![](https://github.com/Konnits/T2/blob/main/Images/get_reino_tiene_defensa.png)

-----


#### (PUT) Actualizar reino_tiene_defensa - /api/reino_tiene_defensa

Para actualizar un registro debemos proporcionar id_reino, id_defensa y cantidad, pues, cantidad al ser el único valor actualizable, es necesario para que esta acción tenga sentido.

Parámetros:

- id_reino: int (required)
- id_defensa: int (required)
- cantidad: int (required)

![](https://github.com/Konnits/T2/blob/main/Images/update_reino_tiene_defensa.png)

-----

#### (DELETE) Borrar reino_tiene_defensa - /api/reino_tiene_defensa

Para eliminar las defensas de un reino es necesario contar con los id_reino e id_defensa.

Parámetros:

- id_reino: int (required)
- id_defensa: int (required)

![](https://github.com/Konnits/T2/blob/main/Images/delete_reino_tiene_defensa.png)


-----

### Diplomacias

#### (POST) Crear diplomacias - /api/diplomacias

Para crear una diplomacia es necesario proporcionar el id de los dos reinos y si son aliados o no.

Parámetros:

- id_reino_1: int (required)
- id_reino_2: int (required)
- es_aliado: boolean (required)

![](https://github.com/Konnits/T2/blob/main/Images/create_diplomacias.png)

-----

#### (GET) Obtener diplomacias - /api/diplomacias

Se puede obtener la totalidad de las diplomacias que existen, al no colocar ningún parámetro en la petición, por otro lado, cualquier parámetro que se agregue, filtrará los datos.

Parámetros:

- id_reino_1: int
- id_reino_2: int
- es_aliado: boolean

![](https://github.com/Konnits/T2/blob/main/Images/get_diplomacias.png)

-----


#### (PUT) Actualizar diplomacias - /api/diplomacias

Para actualizar un registro debemos proporcionar id_reino_1, id_reino_2 y es_aliado, pues, es_aliado al ser el único valor actualizable, es necesario para que esta acción tenga sentido.

Parámetros:

- id_reino_1: int (required)
- id_reino_2: int (required)
- es_aliado: boolean (required)

![](https://github.com/Konnits/T2/blob/main/Images/update_diplomacias.png)

-----

#### (DELETE) Borrar diplomacias - /api/diplomacias

Para eliminar las diplomacias entre dos reinos es necesario contar con los id_reino_1 e id_reino_2.

Parámetros:

- id_reino_1: int (required)
- id_reino_2: int (required)

![](https://github.com/Konnits/T2/blob/main/Images/delete_diplomacias.png)

-----