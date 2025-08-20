# Simulación Urbana en NetLogo - Proyecto de Vida Artificial

[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/valtimore/Segregacion-Simulada/blob/main/README.md)
[![es](https://img.shields.io/badge/lang-es-blue.svg)](https://github.com/valtimore/Segregacion-Simulada/blob/main/README-es.md)

![NetLogo](https://img.shields.io/badge/NetLogo-6.3.0%2B-green)

Simulación de dinámicas urbanas y segregación socioeconómica utilizando el software NetLogo para modelar y analizar el impacto de políticas urbanas.

## 📋 Descripción del Proyecto

Este proyecto implementa un autómata celular que simula una ciudad con **diferentes clases sociales** y **entidades de servicios**, desarrollado como parte del curso de Vida Artificial de la Universidad del Valle. La simulación modela cómo las políticas urbanas afectan la distribución y evolución de las clases sociales a lo largo del tiempo.

**Integrantes:**
- Juan David Cataño Castillo (202160227)
- Valentina Londoño Dueñas (202160173)

**Fecha de Presentación:** Junio de 2024

## 🎯 Objetivos

- Modelar una ciudad virtual con diferentes clases sociales (alta, media, baja).
- Implementar entidades de servicios que influyen en el desarrollo urbano (hospitales, universidades, tiendas).
- Simular el impacto de diferentes políticas urbanas en la segregación socioeconómica.
- Analizar la evolución de indicadores socioeconómicos bajo diferentes escenarios políticos.

## 🛠️ Metodología y Herramientas

El proyecto se realizó siguiendo estos pasos:

1.  **Diseño del modelo:** Definición de atributos celulares (clase social, ingresos, servicios, educación).
2.  **Implementación:** Programación del autómata celular en NetLogo con reglas de evolución.
3.  **Simulación:** Ejecución de escenarios bajo diferentes políticas urbanas.
4.  **Análisis:** Observación de patrones emergentes y medición de indicadores socioeconómicos.

**Herramienta Principal:** [NetLogo - Multi-agent programmable modeling environment](https://ccl.northwestern.edu/netlogo/)

## 📊 Características del Modelo

El autómata celular incluye las siguientes propiedades:

| Atributo | Descripción |
| :--- | :--- |
| `is-high-class?` | Indica si pertenece a la clase alta |
| `is-middle-class?` | Indica si pertenece a la clase media |
| `is-low-class?` | Indica si pertenece a la clase baja |
| `is-hospital?` | Indica si es una entidad hospital |
| `is-university?` | Indica si es una entidad universidad |
| `is-store?` | Indica si es una entidad tienda |
| `cell-income` | Ingresos económicos de la celula |
| `cell-services` | Accesibilidad a servicios (1, 2, 3) |
| `cell-education` | Nivel educativo (1, 2, 3) |
| `IPM-value` | Valor para determinar la clase social |

## 🎮 Instrucciones de Uso

**Requisito:** Tener instalado NetLogo (versión 6.3.0 o superior)

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/valtimore/Segregacion-Simulada.git
    ```

2.  **Abrir el archivo en NetLogo:**
    - Inicia NetLogo
    - Dirígete a `Archivo -> Abrir` y selecciona `SegregacionFinal.nlogo`

3.  **Controles de la simulación:**
    - `Extinción`: Elimina toda la población existente
    - `Nacimiento`: Genera nueva población según configuraciones
    - `Iniciar`: Ejecuta la simulación

4.  **Monitores:**
    - `Total clase baja`: Cantidad de personas de clase baja
    - `Total clase media`: Cantidad de personas de clase media
    - `Total clase alta`: Cantidad de personas de clase alta
    - `Clase`: Clase social de la celula bajo el cursor
    - `Información Ingresos`: Ingresos de la celula bajo el cursor
    - `Información servicios`: Nivel de servicios de la celula bajo el cursor
    - `Información Educación`: Nivel educativo de la celula bajo el cursor

## 📈 Escenarios de Políticas Urbanas

El modelo permite simular tres políticas diferentes:

### 🏘️ Normalidad
Simulación realista donde las riquezas se agrupan en sectores específicos con poca variación. Los sectores críticos no reciben ayuda externa.

![Normalidad](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/2d796d10-ef56-4bc1-a551-56f0e4b4494e)

### ⚖️ Equidad
Política de ayuda económica hacia sectores vulnerables. Clases alta y media pagan impuestos destinados a la clase baja, estabilizando el nivel adquisitivo.

![Equidad](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/12d5590c-e95b-4024-90ec-ae9cc30e3545)

### 💰 Capitalismo Salvaje
Escenario extremo donde la clase alta acapara todos los ingresos, simulando fenómenos de corrupción.

![Capitalismo Salvaje](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/0c754035-1ef6-4ec1-bd1a-4f26f0fee15f)

## 📊 Métricas y Análisis

El modelo permite observar:
- Distribución espacial de clases sociales
- Evolución temporal de indicadores socioeconómicos
- Impacto de políticas en la movilidad social
- Patrones emergentes de segregación urbana

## 📚 Conclusión y Perspectivas Futuras

La simulación permite analizar cómo diferentes políticas urbanas afectan la segregación socioeconómica y la distribución espacial de la riqueza. Como trabajo futuro, se propone:

- Incorporar más variables demográficas y económicas
- Modelar migración entre diferentes áreas de la ciudad
- Implementar intervenciones políticas más granularizadas
- Conectar el modelo con datos urbanos reales para validación

## 📖 Referencias

1. Wilensky, U. (1999). NetLogo. Center for Connected Learning and Computer-Based Modeling, Northwestern University.
2. Schelling, T. C. (1971). Dynamic models of segregation. Journal of mathematical sociology, 1(2), 143-186.
3. Batty, M. (2007). Cities and complexity: understanding cities with cellular automata, agent-based models, and fractals. MIT press.

## 📞 Contacto

Para consultas o problemas técnicos:

- Juan David Cataño Castillo - `juan.david.catano@correounivalle.edu.co`
- Valentina Londoño Dueñas - `valentina.londono.duenas@correounivalle.edu.co`

---

*Proyecto desarrollado para el curso de Vida Artificial - Universidad del Valle - 2024*

<sub>29/06 - ¡Oh! La población existente en esta ciudad ha llegado a la vejez, ya no puede trabajar, los ricos se han pensionado y los pobres invaden los semáforos pidiendo algo de dinero... Todo esto se hubiera podido evitar si el mundo hubiera recibido una calificación pronta...</sub>
