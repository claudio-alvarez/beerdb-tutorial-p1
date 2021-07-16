# Taller: Diseño e implementación de una base de datos relacional, Parte 1

En este taller, vamos a diseñar e implementar una base de datos relacional. Para comenzar, desarrollaremos un modelo visual de la base de datos. Luego, especificaremos las relaciones en formato textual y crearemos sentencias de SQL (_Database Description Language_, DDL) para crear las tablas respectivas en la base de datos.

## Pre-Requisitos

Para realizar este taller, necesitarás contar con un par de herramientas gratuitas:

* [draw.io](https://www.draw.io). Se trata de una aplicación web que permite crear distintos tipos de diagramas. Se integra con Google Drive. Para usar draw.io, puedes crear una cuenta utilizando tu usuario Google institucional (@miuandes.cl). 

Cuando te hayas registrado y entres a draw.io, verás un menú de inicio. Debes elegir la opción "Create New Diagram". Luego, en la ventana siguiente, escoger en el listado a la izquierda "Basic", y en el de la derecha, la opción "Entity Relationship Diagram".

Una vez creado el documento en blanco, estarás listo(a) para crear un diagrama del tipo "Entidad-Relación" (E-R), como veremos más adelante.
* [Visual Studio Code (VS Code) de Microsoft](https://code.visualstudio.com/). VS Code es una herramienta muy popular entre desarrolladores de software y está disponible gratuitamente para Windows, Mac y Linux. Es posible utilizar bases de datos SQLite en VS Code si se instala una extensión. Explicaremos aquí cómo se hace.

Primero, se debe instalar VSCode, siguiendo los pasos a continuación:

* Ir a https://code.visualstudio.com/
* Pinchar el enlace de descarga "Download" que aparece en la esquina superior derecha de la página, y luego escoger la versión a descargar según el sistema operativo utilizado. Elige la versión de 64 bits para el tipo de computador que utilizas (Windows o Mac).
* Abrir el instalador una vez descargado y seguir los pasos. El programa VS Code quedará accesible a través del menú inicio (Windows), con el nombre VS Code, o en la carpeta Aplicaciones (Applications) en Mac.
* Abrir VS Code y pinchar en el ícono de engranaje que aparece en la parte inferior-izquierda de la ventana. Elegir la opción "Extensions".
* Aparecerá una barra de búsqueda arriba a la izquierda con texto "Search Extensions in Market...". Ahí, ingresar "SQLite". En los resultados de búsqueda aparecerá SQLite con descripción "Explore and query SQLite databases". Pinchar el botón azul que dice "Install".
* Una vez instalada la extensión de SQLite, presionar Ctrl+Shift+P (Windows) o Comando+Shift+P (Mac). Se activará una línea de comando en la parte superior de la ventana, en la cual es posible digitar comandos. Si escribes "SQLite" y aparece una serie de opciones (ver imagen a continuación), entonces VSCode está correctamente instalado con todo lo necesario para realizar este taller.

## Diagrama Entidad-Vínculo (E-V)

Para crear una base de datos relacional, es una buena idea comenzar por crear un modelo visual o diagrama que permita entender la naturaleza de los datos y sus interrelaciones. Veremos aquí en qué consiste un diagrama "Entidad-Vínculo" (diagrama E-V, también conocido como diagrama "Entidad-Relación", E-R).  

### Entidades y Atributos

Un diagrama E-V ilustra las _entidades_ que existen en un dominio de negocio, y cómo éstas se vinculan/relacionan. Una entidad es un objeto del dominio del negocio, virtual o físico, que puede ser descrito consistentemente por un conjunto de _campos_ o _atributos_. Por ejemplo, _Persona_ es una entidad que podría ser descrita por atributos como _nombre_, _apellido_, _correo electrónico_, _edad_, etc. 

En un diagrama E-V, las entidades son representadas por rectángulos rotulados como en la figura arriba. Los _atributos_ de una entidad se representan con óvalos conectados con líneas rectas al rectángulo de la entidad respectiva. Cada óvalo indica el nombre del atributo correspondiente. Una entidad tendrá uno o más atributos _clave_. Los atributos clave son los que permiten distinguir una _instancia_ de una entidad de otra. Por ejemplo, para las personas la dirección de correo electrónico personal podría ser utilizada como clave si toda persona tuviera una cuenta de correo electrónico. Es decir, con la dirección de correo electrónico una persona es distinguible de otra persona, por lo tanto, la dirección de correo electrónico puede considerarse una clave. Los nombres de los atributos clave van subrayados en los óvalos del diagrama E-R.

### Vínculos y Cardinalidades

Las entidades pueden vincularse entre sí. Por ejemplo, una Persona puede _tener_ cero o más Propiedades (bienes raíces). También, una persona podría tener cero o más vehículos inscritos a su nombre. Además, una Persona podría relacionarse con otra persona si es su cónyuge.

Para incorporar vínculos a un diagrama E-V, se utilizan _conectores_ de vínculo con _extremos_ y _rombo_ al centro. Cada extremo de un vínculo va conectado a una de las entidades del modelo E-V. El rombo de un vínculo indica el tipo de relación que existe entre las entidades. Por ejemplo, "Persona _tiene_ cero o más vehículos", se puede diagramar de la siguiente manera:

Como se puede ver arriba, los números (o símbolos) en los extremos del conector de vínculo indican cuántos entes de un lado del vínculo se pueden relacionar al ente del otro lado del vínculo. Es decir, los extremos del conector de vínculo establecen las cardinalidades posibles en el vínculo.

Existen varias posibles cardinalidades en los vínculos:

* Uno a uno (1-1): Una Persona tiene un Pasaporte y el Pasaporte puede ser usado por una Persona.
* Uno a N (1-N): Una Persona puede tener múltiples (N) Domicilios pero un Domicilio pertenece a sólo una Persona.
* N a N (N-N): Una Persona puede ser ciudadano(a) de múltiples (N) países, y a su vez, un país puede tener múltiples (N) Personas ciudadanas.

En los extremos de la relación, las cardinalidades además pueden precisar si hay vínculo posible con cero entidades. Así, en vez de indicar 1 ó N en un extremo del vínculo, es posible indicar 0..N, o 0..1. Por ejemplo, una Persona podría tener de _cero_ a _N_ Vehículos. También, una Persona podría tener de _cero_ a _un_ Pasaporte.

Por último, un vínculo entre dos entidades, puede tener atributos propios que lo describen. Por ejemplo si "Persona _compra un_ Vehículo", el vínculo _compra un_ puede tener un atributo _fecha_ que indique la fecha en la que se realiza la compra. La definición de atributos en los vínculos sólo se utiliza en casos en que es necesario u oportuno. Lo más común es que los vínculos no tengan atributos.

## Dominio de Negocio a Modelar

Vamos a crear un diagrama E-V para el mundo de las cervezas. La primera entidad que podemos reconocer aquí es la entidad "Cerveza". Una Cerveza tiene un nombre, p.ej., "patagonia", "Calafate", "Alkoholfrei", o "Lager" y puede corresponder a una cierta Marca; por ejemplo, "Kustmann", "Austral", "Corona", etc. A su vez, una Marca de Cerveza es producida por una cierta Cervecería, por ejemplo, "CCU S.A.".

Existen catadores de cervezas, o sommeliers de cerveza que son conocidos como cicerones. Un Cicerone cata una cerveza y escribe una Evaluación al respecto. Una Cerveza puede tener muchas evaluaciones de distintos cicerones, y a su vez un Cicerone puede escribir muchas evaluaciones, pero una sola por Cerveza. Por último Un Cicerone, igual que cualquier persona, reside en un determinado País.

Vemos en la descripción anterior que existen varias _entidades_ en nuestro dominio del negocio. Las listamos a continuación con su traducción a inglés (esto debido a que más adelante la implementación de la base de datos la realizaremos en inglés), y atributos, también en inglés:

* Cerveza (Beer): id*, name, alcvol, flavor, price, contents, unit_price
* Marca (Brand): id*, name
* Cervecería (Brewery): name*, estdate
* Cliente (Customer): email*, first_name, last_name
* Pedido (Order): id*, date, total
* País (Country): name*

Indicamos atributos clave con asterisco (el asterisco no es parte del nombre).

Además, observamos que los elementos antes listados se relacionan de las siguientes maneras:

* Una Cerveza pertenece a una Marca, y una Marca tiene una o muchas Cervezas.
* Una Marca pertenece a una Cervecería, y una Cervecería tiene una o muchas marcas.

## Paso 1: Crear Diagrama E-V (30 minutos)

Usando [draw.io](https://www.draw.io), crearemos un diagrama E-V para representar el dominio de negocio anterior. Considera todas las entidades y vínculos que aparecen descritas en el enunciado arriba. Debes diagramar las entidades con sus atributos, y los vínculos. Los vínculos deben especificar las cardinalidades.

En principio, el proceso de diagramado puede parecer un tanto lento/engorroso. El profesor dará varios consejos sobre cómo utilizar la herramienta draw.io en forma más eficiente. 

## Paso 2: Especificar las relaciones de la base de datos (20 minutos)

Una vez creado el diagrama E-V, definiremos las relaciones (tablas) de nuestra base de datos. El proceso de definir las tablas se basa en el diagrama E-V, con la siguientes consideraciones:

* Se crea una tabla por cada entidad. Adoptamos la convención de nombrar cada tabla con el nombre de la entidad en minúsculas, en inglés y en plural. Por ejemplo, para la entidad "Customer" (Cliente) creamos la tabla `customers`.
* Cada atributo de la entidad pasa a ser una columna de la tabla respectiva. Los nombres de los atributos van en minúscula. Cuando son compuestos por dos o más palabras, se separan por guiones bajos, p.ej., `unit_price`.
* Cuando se tiene un vínculo 1-N (o 0..1-N) entre dos entidades, a la tabla correspondiente a la entidad del lado de cardinalidad 1 en el vínculo se le agrega una clave foránea a la tabla en el lado de cardinalidad N.
* Lo anterior vale también para cuando se tiene un vínculo 1-1, pero en este caso, se incorpora después en la definición de la tabla usando SQL/DDL, que la clave foránea es única (_unique_).
* Cuando se tiene un vínculo N-N, se crea una tabla de unión, con claves foráneas a cada entidad que participa en el vínculo. La clave de la tabla de unión es compuesta por ambas claves foráneas. El nombre de la tabla de unión puede componerse por los nombres de las dos entidades del vínculo, en minúscula, separados por guión bajo.
* Si un vínculo tiene atributos, éstos se incorporan como columnas a la tabla que contiene la clave foránea. En el caso de un vínculo N-N, los atributos del vínculo se agregan a la tabla de unión.

Para especificar las tablas, usaremos la siguiente sintaxis:

`Nombre_Entidad(atributo_1, atributo2, ..., atributoN)`

Considerando dicha sintaxis, las reglas anteriores, y el diagrama E-V, la tarea ahora es especificar todas las tablas necesarias para crear nuestra base de datos.

## Paso 3: Utilizar SQL-DDL para crear las tablas (30 minutos)

El último paso de la primera parte de este tutorial es escribir las sentencias de SQL-DDL para crear las tablas de nuestra base de datos.

Para escribir las sentencias, usamos la instrucción `CREATE TABLE`. La sintaxis detallada para SQLite se puede [encontrar aquí](https://www.sqlite.org/lang_createtable.html).

Al usar `CREATE_TABLE` se debe especificar el tipo de dato de cada columna. Tipos de datos (o "clases de almacenamiento") básicos en SQLite, son los siguientes:

* NULL
* INTEGER
* REAL
* TEXT
* BLOB

Para crear una clave primaria numérica, que se auto-incremente, se utiliza el tipo `INTEGER PRIMARY KEY ASC` (ver [documentación aquí](https://www.sqlite.org/lang_createtable.html#rowid)).



