# Taller: Diseño e implementación de una base de datos relacional

En este taller, vamos a diseñar e implementar una base de datos relacional. Para comenzar, desarrollaremos un modelo visual de la base de datos, luego especificaremos las relaciones en formato textual y crearemos sentencias de SQL (_Database Description Language_, DDL) que crearán las tablas respectivas en la base de datos. Una vez creada la base de datos, poblaremos las tablas y ejecutaremos algunas consultas.

# Herramientas a utilizar

## Modelamiento visual

Para crear nuestro modelo visual de la base de datos, podemos utilizar [draw.io](https://www.draw.io). Se trata de una aplicación que permite crear distintos tipos de diagramas técnicos en el navegador web. Para usar draw.io, puedes crear una cuenta utilizando tu usuario Google institucional (@miuandes.cl). 

Cuando entres a draw.io, verás un menú y debes elegir la opción "Create New Diagram". Luego, en la ventana siguiente, escoger en el listado a la izquierda "Basic", y en el de la derecha, la opción "Entity Relationship Diagram".

Una vez creado el documento en blanco, estarás listo(a) para comenzar tu trabajo de acuerdo a las indicaciones que te damos más adelante.

## Implementación de la base de datos y consultas

Usaremos un par de herramientas gratuitas para implementar nuestra base de datos y realizar consultas.

### Motor de base de datos

Usaremos el software de bases de datos relacional más popular del mundo: SQLite. Este software se utiliza bastante, tanto en aplicaciones de celular como de escritorio. SQLite es un software de bases de datos de tipo _embebido_. Esto quiere decir que no se requiere un software complejo (un _motor_ como Oracle, Microsoft SQL Server, o Postgres) para operar la base de datos. Basta una aplicación capaz de leer la base de datos, lo cual describiremos en el apartado a continuación.

### Editor e interfaz de consultas

Para implementar nuestra base de datos y realizar consultas, utilizaremos Visual Studio Code (VS Code) de Microsoft. Esta es una herramienta muy popular y está disponible gratuitamente para Windows, Mac y Linux. Es posible utilizar bases de datos SQLite si se instala una extensión. Explicaremos aquí cómo se hace.

Primero, se debe instalar VSCode, siguiendo los pasos a continuación:

* Ir a https://code.visualstudio.com/
* Pinchar el enlace de descarga "Download" que aparece en la esquina superior derecha de la página, y luego escoger la versión a descargar según el sistema operativo utilizado. Si no sabes qué versión exacta descargar (32 bits o 64 bits), elige la versión de 64 bits para el tipo de computador que utilizas (Windows o Mac).
* Abrir el instalador una vez descargado y seguir los pasos. El programa VS Code quedará accesible a través del menú inicio (Windows), con el nombre VS Code, o en la carpeta Aplicaciones (Applications) en Mac.
* Abrir VS Code por primera vez. Una vez cargado, pinchar en el ícono de engranaje que aparece en la parte inferior-izquierda de la ventana. Elegir la opción "Extensions".
* Aparecerá una barra de búsqueda arriba a la izquierda con texto "Search Extensions in Market...". Ahí, ingresar "SQLite". En los resultados de búsqueda aparecerá SQLite con descripción "Explore and query SQLite databases". Pinchar el botón azul que dice "Install".
* Una vez instalada la extensión de SQLite, presionar Ctrl+Shift+P (Windows) o Comando+Shift+P (Mac). Aparecerá una ventana con un cursor en la cual es posible escribir. Si escribes "SQLite" y aparece una serie de opciones (ver imagen a continuación), entonces VSCode está correctamente instalado con todo lo necesario para realizar este taller.



## Modelo Entidad-Relación (E-R)

Para crear una base de datos relacional, es una buena idea comenzar por crear un modelo visual o diagrama que permita entender la naturaleza de los datos y sus interrelaciones. Para realizar este modelamiento, consideramos los elementos (entidades) que existen y que se interrelacionan en el _dominio del negocio_. 

Por ejemplo, si queremos crear una base de datos que almacene información sobre cervezas (que por cierto realizaremos en este taller), debemos considerar que una entidad central en el modelo de la base de datos a implementar es justamente la entidad "Cerveza". Una Cerveza tiene un nombre, p.ej., "patagonia", "Calafate", "Alkoholfrei", o "Lager" y puede corresponder a una cierta Marca; por ejemplo, "Kustmann", "Austral", "Corona", etc. A su vez, una Marca de Cerveza es producida por una cierta Cervecería, por ejemplo, "CCU S.A.".

Existen catadores de cervezas, o sommeliers de cerveza que son conocidos como _cicerones_. Un _Cicerone_ cata cervezas y escribe sus evaluaciones al respecto. Una cerveza puede tener muchas evaluaciones de distintos _cicerones_, y a su vez un _Cicerone_ puede escribir muchas evaluaciones, pero una sola por cerveza. Por último Un _Cicerone_, igual que cualquier persona, reside en un determinado País.

Vemos en la descripción anterior que existen varias _entidades_ en nuestro dominio del negocio. Las listamos a continuación con su traducción a inglés (esto debido a que más adelante la implementación de la base de datos la realizaremos en inglés):

* Cerveza (Beer)
* Marca (Brand)
* Cervecería (Brewery)
* Evaluación (Review)
* Cicerone (Cicerone)
* País (Country)

Además, observamos que los elementos antes listados 

En la primera parte de este taller, dedicaremos tiempo a crear un diagrama E-R. 

