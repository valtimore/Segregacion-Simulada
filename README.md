# Simulación Urbana en NetLogo

Este proyecto es una simulación urbana en NetLogo que modela una ciudad con ciertas políticas urbanas. La simulación incluye diferentes tipos de celdas que representan clases sociales, servicios y características. El objetivo es observar cómo las políticas afectan la distribución y evolución de estas celdas a lo largo del tiempo.

## Descripción del Proyecto

Para la construcción de nuestro autómata, se optó por implementar clases sociales y entidades que representan distintos lugares que afectarán de una forma u otra el desarrollo de las celulas.

- `is-high-class?`: Indica si pertenece a la clase alta.
- `is-middle-class?`: Indica si pertenece a la clase media.
- `is-low-class?`: Indica si pertenece a la clase baja.
- 
- `is-hospital?`: Indica si es una célula de tipo entidad hospital.
- `is-university?`: Indica si es una célula de tipo entidad universidad
- `is-store?`: Indica si es una célula de tipo entidad tienda.
- 
- `cell-income`: Ingresos económicos de la celula.
- `cell-services`: Accesibilidad a servicios de la celula, número entre '1, 2, 3'.
- `cell-education`: Nivel educativo de la celula, número entre '1, 2, 3'..
- `IPM-value`: Valor para determinar la clase social de cada celula.


## Instrucciones de Uso

Para la correcta ejecución del proyecto, es crucial tener instalado en el equipo la última versión del entorno de desarrollo NetLogo. Contando con este, se puede seguir con la explicación.

**1. Clonar el repositorio:**

**2. Abrir el archivo en NetLogo:**

- Inicia NetLogo.
- Dirígete a `Archivo -> Abrir` y selecciona el archivo `SegregacionFinal.nlogo` que clonaste desde Github.

**3. Ejecución del modelo:**

Al cargar correctamente el archivo, se generarán distintos botones y monitores en la interfaz. Cada uno cuenta con una funcionalidad.

- `Extinción`: Al presionar este botón, toda la población existente en la simulación morirá.
- `Nacimiento`: Por medio de este botón, se generará toda la población en el mundo simulado, la cual se distribuirá según las configuraciones dadas.
- `Iniciar`: Este botón ejecuta la simulación.

- `Total clase baja`: Este monitor nos indica la cantidad de personas de clase baja existentes.
- `Total clase media`: Este monitor nos indica la cantidad de personas de clase media existentes.
- `Total clase alta`: Este monitor nos indica la cantidad de personas de clase alta existentes.
- `Clase`: Este monitor nos indica de que clase es la celula sobre la cual posemos el mouse.
- `Información Ingresos`: Este monitor nos indica la cantidad de ingresos de la celula sobre la cual posemos el mouse.
- `Información servicios`: Este monitor nos indica el nivel de servicios de la celula sobre la cual posemos el mouse.
- `Información Educación`: Este monitor nos indica el nivel de educación de la celula sobre la cual posemos el mouse.

Además, podrá ubicar un selector el cual se titula `Politica`, mediante este podrá cambiar las reglas definidas a cada celula. Es importante primero generar una nueva población entre cada cambio para observar óptimamente el comportamiento de la población. Podrá elegir tres opciones:

- `Normalidad`: La simulación más realista; En esta las riquezas se verán agrupadas en sectores específicos que dificilmente variarán, al igual que los sectores críticos, quienes no recibirán ayuda de agentes externos, por lo cual se mantendrán en su situación, o, variarán con la clase media.

![image](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/2d796d10-ef56-4bc1-a551-56f0e4b4494e)

- `Equidad`: Aquí, se implementa una política de ayuda económica hacía los sectores más vulnerables de la población. Tanto las clases Alta y Media deberán pagar cierta cantidad de impuestos destinada hacía la clase baja (la clase media también recibe un impuesto en menor medida), estabilizando así el nivel adquisitivo.

![image](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/12d5590c-e95b-4024-90ec-ae9cc30e3545)
  
- `Capitalismo Salvaje`: Esta es la simulación más extrema; Aquí las personas de clase alta acapararán todos los ingresos. Esto se puede definir como un fenómeno de corrupción, visto en varias ciudades en menor medida.

![image](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/0c754035-1ef6-4ec1-bd1a-4f26f0fee15f)

## Método de contacto

Si el proyecto no se ejecuta correctamente, o directamente no abre, puede contactarse con cualquier miembro del equipo por medio de los siguientes medios:

- Juan David Cataño Castillo  -   `juan.david.catano@correounivalle.edu.co`
- Valentina Londoño Dueñas    -   `valentina.londono.duenas@correounivalle.edu.co`
- Kevin Estiven Gil Salcedo   -   `kevin.gil@correounivalle.edu.co`
- Nicolás Prado León          -   `nicolas.prado@correounivalle.edu.co`

Si existe alguna duda puntual, también puede contactar con cualquier integrante por medio de Telegram. 

<sub>29/06 - ¡Oh! La población existente en esta ciudad ha llegado a la vejez, ya no puede trabajar, los ricos se han pensionado y los pobres invaden los semáforos pidiendo algo de dinero... Todo esto se hubiera podido evitar si el mundo hubiera recibido una calificación pronta... </sub>

