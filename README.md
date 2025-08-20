# Urban Simulation in NetLogo - Artificial Life Project

[![en](https://img.shields.io/badge/lang-en-blue.svg)](https://github.com/valtimore/Segregacion-Simulada/blob/main/README.md)
[![es](https://img.shields.io/badge/lang-es-blue.svg)](https://github.com/valtimore/Segregacion-Simulada/blob/main/README-es.md)

![NetLogo](https://img.shields.io/badge/NetLogo-6.3.0%2B-green)

Simulation of urban dynamics and socioeconomic segregation using NetLogo to model and analyze the impact of different urban policies on social stratification.

## 📋 Project Description

This project implements a cellular automaton that simulates a city with **different social classes** and ** service entities**, developed as part of the Artificial Life course at Universidad del Valle. The simulation models how various urban policies affect the spatial distribution and evolution of social classes over time.

**Team Members:**
- Juan David Cataño Castillo (202160227)
- Valentina Londoño Dueñas (202160173)

**Presentation Date:** June 2024

## 🎯 Objectives

- Model a virtual city with distinct social classes (high, middle, low)
- Implement service entities that influence urban development (hospitals, universities, stores)
- Simulate the impact of different urban policies on socioeconomic segregation
- Analyze the evolution of socioeconomic indicators under various political scenarios

## 🛠️ Methodology and Tools

The project was developed following these steps:

1.  **Model Design:** Definition of cellular attributes (social class, income, services, education).
2.  **Implementation:** Programming the cellular automaton in NetLogo with evolution rules.
3.  **Simulation:** Execution of scenarios under different urban policies.
4.  **Analysis:** Observation of emergent patterns and measurement of socioeconomic indicators.

**Main Tool:** [NetLogo - Multi-agent programmable modeling environment](https://ccl.northwestern.edu/netlogo/)

## 📊 Model Characteristics

The cellular automaton includes the following properties:

| Attribute | Description |
| :--- | :--- |
| `is-high-class?` | Indicates if belongs to high social class |
| `is-middle-class?` | Indicates if belongs to middle social class |
| `is-low-class?` | Indicates if belongs to low social class |
| `is-hospital?` | Indicates if it's a hospital entity |
| `is-university?` | Indicates if it's a university entity |
| `is-store?` | Indicates if it's a store entity |
| `cell-income` | Economic income of the cell |
| `cell-services` | Service accessibility level (1, 2, 3) |
| `cell-education` | Education level (1, 2, 3) |
| `IPM-value` | Value to determine social class |

## 🎮 Usage Instructions

**Requirement:** NetLogo installed (version 6.3.0 or higher)

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/valtimore/Segregacion-Simulada.git
    ```

2.  **Open the file in NetLogo:**
    - Launch NetLogo
    - Go to `File  -> Open` and select `SegregacionFinal.nlogo`

3.  **Simulation controls:**
    - `Extinción`: Removes all existing population
    - `Nacimiento`: Generates new population according to configurations
    - `Iniciar`: Executes the simulation

4.  **Monitors:**
    - `Total clase baja`: Quantity of low-class individuals
    - `Total clase media`: Quantity of middle-class individuals
    - `Total clase alta`: Quantity of high-class individuals
    - `Clase`: Social class of the cell under cursor
    - `Información Ingresos`: Income of the cell under cursor
    - `Información servicios`: Service level of the cell under cursor
    - `Información Educación`: Education level of the cell under cursor

## 📈 Urban Policy Scenarios

The model allows simulation of three different policies:

### 🏘️ Normalidad
Realistic simulation where wealth clusters in specific sectors with little variation. Critical sectors receive no external help.

![Normalidad](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/2d796d10-ef56-4bc1-a551-56f0e4b4494e)

### ⚖️ Equidad
Policy of economic assistance toward vulnerable sectors. High and middle classes pay taxes directed to the low class, stabilizing purchasing power.

![Equidad](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/12d5590c-e95b-4024-90ec-ae9cc30e3545)

### 💰 Capitalismo Salvaje
Extreme scenario where the high class monopolizes all income, simulating corruption phenomena.

![Capitalismo Salvaje](https://github.com/valtimore/Segregacion-Simulada/assets/119082415/0c754035-1ef6-4ec1-bd1a-4f26f0fee15f)

## 📊 Metrics and Analysis

The model allows observation of::
- Spatial distribution of social classes.
- Temporal evolution of socioeconomic indicators.
- Impact of policies on social mobility.
- Emergent patterns of urban segregation.

## 📚 Conclusion and Future Perspectives

The simulation enables analysis of how different urban policies affect socioeconomic segregation and spatial wealth distribution. As future work, we propose:

- Incorporate more demographic and economic variables
- Model migration between different city areas
- Implement more granular policy interventions
- Connect the model with real urban data for validation

## 📖 References

1. Wilensky, U. (1999). NetLogo. Center for Connected Learning and Computer-Based Modeling, Northwestern University.
2. Schelling, T. C. (1971). Dynamic models of segregation. Journal of mathematical sociology, 1(2), 143-186.
3. Batty, M. (2007). Cities and complexity: understanding cities with cellular automata, agent-based models, and fractals. MIT press.

## 📞 Contact

For queries or technical issues:

- Juan David Cataño Castillo - `juan.david.catano@correounivalle.edu.co`
- Valentina Londoño Dueñas - `valentina.londono.duenas@correounivalle.edu.co`

---

*Project developed for the Artificial Life course - Universidad del Valle - 2024*

<sub>29/06 - Oh! The existing population in this city has reached old age, can no longer work, the rich have retired, and the poor invade traffic lights asking for money... All this could have been avoided if the world had received prompt grading...</sub>
