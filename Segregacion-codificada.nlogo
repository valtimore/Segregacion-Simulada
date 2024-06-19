;; Variables globales definidas

globals [

  random-variable      ;; Generar valores aleatorios
  class-info           ;; Información sobre la clase
  education-info       ;; Información sobre el nivel de educación
  services-info        ;; Información sobre los servicios
  income-info          ;; Información sobre los ingresos

]

patches-own [

  is-living?                      ;; Muestra si la celda está ocupada
  is-high-class?                  ;; Muestra si la celda es 'clase alta'
  is-middle-class?                ;; Muestra si la celda es 'clase media'
  is-low-class?                   ;; Muestra si la celda es 'clase baja'
  is-hospital?                    ;; Muestra si la celda es un hospital
  is-university?                  ;; Muestra si la celda es una universidad
  is-store?                       ;; Muestra si la celda es una tienda

  cell-income                     ;; Ingresos de la celda
  cell-services                   ;; Servicios de la celda
  cell-education                  ;; Nivel educativo de la celda
  transition-value                ;; Valor usado para determinar la clase social

  high-class-neighbors            ;; Vecinos de 'clase alta'
  middle-class-neighbors          ;; Vecinos de 'clase media'
  low-class-neighbors             ;; Vecinos de 'clase baja'
  university-neighbors            ;; Vecinos que son universidades
  hospital-neighbors              ;; Vecinos que son hospitales
  store-neighbors                 ;; Vecinos que son tiendas
  park-neighbors                  ;; Vecinos que son parques
  living-neighbors                ;; Vecinos que están vivos

]

;; Inicializa el mundo vacío

to setup-blank
  clear-all
  ask patches [ initialize-cell ]
  reset-ticks
end

;; Inicializa el mundo con valores aleatorios

to setup-random
  clear-all

  set class-info ""
  set income-info ""
  set services-info ""
  set education-info ""
  set random-variable random 10

;; Establecer cuántas celdas de cada tipo aparecerán en el mundo, a mayor número, menos aparecerán

  ask patches [
    ifelse random-float 200000.0 < initial-density
        [ assign-hospital ]
        [ initialize-cell ]
  ]

  ask patches with [not is-hospital?] [
    ifelse random-float 200000.0 < initial-density
        [ assign-university ]
        [ initialize-cell ]
  ]

  ask patches with [not is-hospital? and not is-university?] [
    ifelse random-float 10000.0 < initial-density
        [ assign-store ]
        [ initialize-cell ]
  ]

  ask patches with [not is-hospital? and not is-university? and not is-store?] [
    let probability random-float 100.0

    ifelse probability < 2.8      ;; Probabilidad de que una celda sea de clase alta
        [ assign-high-class ]
        [ ifelse probability < 70     ;; Probabilidad de que una celda sea de clase media y baja
            [ assign-middle-class ]
            [ assign-low-class ]
    ]

  ]

  reset-ticks

end

;; Restablece el estado de una celda

to initialize-cell

  set is-living? true
  set is-high-class? false
  set is-middle-class? false
  set is-low-class? false
  set is-university? false
  set is-hospital? false
  set is-store? false

end


;; Definición de las clases sociales

to assign-high-class
  initialize-cell
  set is-high-class? true
  set cell-income 3200000
  set cell-education 3
  set cell-services 3
  calculateTransitionValue
  set pcolor green
end

to assign-middle-class
  initialize-cell
  set is-middle-class? true
  set cell-income 2100000
  set cell-education 2
  set cell-services 2
  calculateTransitionValue
  set pcolor yellow
end

to assign-low-class
  initialize-cell
  set is-low-class? true
  set cell-income 700000
  set cell-education 1
  set cell-services 1
  calculateTransitionValue
  set pcolor red
end

;; Definición de celdas de entidades

to assign-hospital
  initialize-cell
  set is-hospital? true
  set transition-value -15
  set pcolor black
end

to assign-university
  initialize-cell
  set is-university? true
  set transition-value -35
  set pcolor white
end

to assign-store
  initialize-cell
  set is-store? true
  set transition-value -25
  set pcolor violet
end

;; Definición de celdas desocupadas

to initialize-dead-cell
  initialize-cell
  set is-living? false
  set pcolor black
end

;; Función para la selección de celdas en la simulación

to update-info-label
  if mouse-inside? [
    let patch-under-mouse patch mouse-xcor mouse-ycor

    set class-info (word "Clase: "
      (ifelse-value [is-low-class?] of patch-under-mouse [ "Baja" ]
        [is-middle-class?] of patch-under-mouse [ "Media" ]
        [is-high-class?] of patch-under-mouse [ "Alta" ]
        [is-hospital?] of patch-under-mouse [ "Hospital" ]
        [is-university?] of patch-under-mouse [ "Universidad" ]
        [is-store?] of patch-under-mouse [ "Tiendas" ]
        [ "Ninguna" ]))

    set income-info     (word "Ingresos: " [cell-income] of patch-under-mouse)
    set education-info  (word "Educacion: " [cell-education] of patch-under-mouse)
    set services-info   (word "Servicios: " [cell-services] of patch-under-mouse)
  ]
end

;; Establece el valor de transición: se divide el valor de los ingresos para eliminar los ceros (ya que se manejan altos valores de ingresos) y se les suman los servicios y educación

to calculateTransitionValue
  set transition-value ((cell-income / 100000) + cell-services + cell-education)
end

;; Actualiza la información de los vecinos de una celda

to update-neighbors-info
  ask patches [

    set high-class-neighbors count neighbors with [is-high-class?]
    set middle-class-neighbors count neighbors with [is-middle-class?]
    set low-class-neighbors count neighbors with [is-low-class?]
    set hospital-neighbors count neighbors with [is-hospital?]
    set university-neighbors count neighbors with [is-university?]
    set store-neighbors count neighbors with [is-store?]

  ]

  end

to set-cell-values
  set cell-income cell-income
  set cell-education cell-education
  set cell-services cell-services
  calculateTransitionValue
end

;; Reglas de transición de clases

to transition-classes ;; Política 'Normalidad': Agrupación de la riqueza, y establecimiento de zonas críticas


  ask patches [ ;; Para la clase Baja

    ifelse ((middle-class-neighbors <= 4 or low-class-neighbors >= 5) and is-low-class?) ;; Sigue igual si la mayoría de sus vecinos son de su misma clase

      [ set-cell-values ]

    [ ifelse ((middle-class-neighbors >= 5 or low-class-neighbors <= 4 ) and is-low-class?) ;; Se beneficia con vecinos de clase media

      [ set cell-income cell-income + 1400000
        set cell-services cell-services + 1
        set cell-education cell-education + 1

        calculateTransitionValue ][
        ifelse (hospital-neighbors >= 1 or university-neighbors >= 1 or store-neighbors >= 1)[ ;; Le benefician las entidades, debido a los arrendos

          set cell-income cell-income + 1400000
          set cell-services cell-services + 2
          set cell-education cell-education + 1
          calculateTransitionValue
        ]
        [ if ((high-class-neighbors >= 5) and is-low-class?) ;; Si su barrio tiene clase alta, se beneficia

          [ set cell-income cell-income + 2500000
            set cell-services cell-services + 2
            set cell-education cell-education + 2
            calculateTransitionValue ]]]]
            ]


  ask patches [ ;; Para la clase Media

    ifelse ((middle-class-neighbors <= 3 and high-class-neighbors >= 4) and is-middle-class?) ;; Se beneficia con vecinos de clase alta

      [ set cell-income cell-income + 1000000
        set cell-services cell-services + 1
        set cell-education cell-education + 1
        calculateTransitionValue ][

        ifelse(hospital-neighbors >= 1 or university-neighbors >= 1 or store-neighbors >= 2)[ ;; Subirá de estrato y nivel de educación con entidades cerca

          set cell-services cell-services + 1.5
          set cell-education cell-education + 1
          calculateTransitionValue
        ]
        [ ifelse ((low-class-neighbors >= 4) and is-middle-class?) ;; Se verá perjudicada si tiene muchos vecinos clase baja

          [ set cell-income cell-income - 1600000
            set cell-services cell-services - 1
            set cell-education cell-education - 1
            calculateTransitionValue ]

          [ if ((middle-class-neighbors >= 4) and is-middle-class?) ;; Seguirá igual si su entorno es clase media
            [ set-cell-values ] ] ] ]]


  ask patches [   ;; Para la clase Alta

    ifelse ((high-class-neighbors >= 5 or middle-class-neighbors >= 4) and is-high-class?) ;; Se beneficia si su entorno es clase alta

      [ set cell-income cell-income + 2500000
        set cell-services cell-services + 2
        set cell-education cell-education + 2
        calculateTransitionValue ]

    [ ifelse ((middle-class-neighbors >= 4 or low-class-neighbors >= 5) and is-high-class?) ;; Se perjudica con vecinos de clase baja

      [ set cell-income cell-income - 1100000
        set cell-services cell-services - 1
        set cell-education cell-education - 1
        calculateTransitionValue ]
      [ ifelse store-neighbors >= 2 [
        set cell-services cell-services - 2
        calculateTransitionValue]

        [if ((low-class-neighbors <= 4) and is-high-class?) ;; Su entorno tiene que ser clase alta para no perder ingresos

          [ set cell-income cell-income - 2500000
            set cell-services cell-services - 2
            set cell-education cell-education - 2
            calculateTransitionValue ] ] ] ]]
end


to transition-classes-taxes ;; Política 'Equidad': Distribución de la riqueza por medio de impuestos


  ask patches [ ;; Para la clase Baja

    ifelse ((low-class-neighbors >= 5 or middle-class-neighbors <= 3) and is-low-class?) ;; Sigue igual si la mayoría de sus vecinos son de su misma clase, ya que nadie le puede dar dinero

      [ set-cell-values ]

    [ ifelse ((middle-class-neighbors >= 4 or low-class-neighbors <= 5 ) and is-low-class?) ;; Recibirá ingresos si tiene vecinos de clase media

      [ set cell-income cell-income + 1200000
        set cell-services cell-services + 1
        set cell-education cell-education + 1
        calculateTransitionValue ][

        ifelse (hospital-neighbors >= 1 or university-neighbors >= 1 or store-neighbors >= 1)[ ;; Le benefician las entidades, debido a los arrendos

          set cell-income cell-income + 900000
          set cell-services cell-services + 2
          set cell-education cell-education + 1
          calculateTransitionValue
        ]

        [ if ((high-class-neighbors >= 1) and is-low-class?) ;; Cada clase alta le proveerá de ingresos

          [ set cell-income cell-income + 1400000
            calculateTransitionValue ]]]]]


  ask patches [   ;; Para la clase Media

    ifelse ((middle-class-neighbors <= 3 and high-class-neighbors >= 1) and is-middle-class?) ;; También recibe ingresos por parte de la clase alta

      [ set cell-income cell-income + 1000000
        calculateTransitionValue ][

        ifelse(hospital-neighbors >= 1 or university-neighbors >= 1 or store-neighbors >= 1)[ ;; Subirá de estrato y nivel de educación con entidades cerca

          set cell-services cell-services + 1.5
          set cell-education cell-education + 1
          calculateTransitionValue
        ]
        [ ifelse ((low-class-neighbors >= 4) and is-middle-class?) ;; Se verá perjudicado, ya que debe pagar impuestos hacía la clase baja

          [ set cell-income cell-income - 600000
            set cell-services cell-services - 1
            set cell-education cell-education - 1
            calculateTransitionValue ]

          [ if ((middle-class-neighbors >= 4) and is-middle-class?) ;; Seguirá igual si su entorno es clase media

            [ set-cell-values ] ] ] ]]


  ask patches [   ;; Para la clase Alta

    ifelse ((high-class-neighbors >= 5 or middle-class-neighbors >= 4) and is-high-class?) ;; Se beneficia si su entorno es mayormente clase alta, no paga impuestos

      [ set cell-income cell-income + 2500000
        set cell-services cell-services + 2
        set cell-education cell-education + 2
        calculateTransitionValue ]

    [ ifelse ((middle-class-neighbors >= 4 or low-class-neighbors >= 5) and is-high-class?) ;; Se perjudica con vecinos de clase baja y media, debe pagar

      [ set cell-income cell-income - 1100000
        calculateTransitionValue ][ifelse (store-neighbors >= 2)[
          set cell-services cell-services - 2
          calculateTransitionValue
        ]
        [ if ((low-class-neighbors <= 4) and is-high-class?) ;; Su entorno tiene que ser clase alta para no perder ingresos

          [ set cell-income cell-income - 1000000
            calculateTransitionValue ] ] ] ]]
end


to transition-classes-capitalism ;; Política 'Capitalismo Salvaje': Las riquezas se concentran únicamente en las clases altas

  ask patches [ ;; Para la clase Baja

    ifelse ((low-class-neighbors >= 5 or middle-class-neighbors <= 4) and is-low-class?) ;; Sigue igual si la mayoría de sus vecinos son de su misma clase

      [ set-cell-values ]

    [ ifelse ((middle-class-neighbors >= 5 or low-class-neighbors <= 4 ) and is-low-class?) ;; Puede ganar ingresos sin tener vecinos clase alta

      [ set cell-income cell-income + 500000
        set cell-services cell-services + 1
        set cell-education cell-education + 1
        calculateTransitionValue ]

        [ if ((high-class-neighbors >= 1) and is-low-class?) ;; Se perjudica con vecinos clase alta, establecen impuestos

          [ set cell-income cell-income - 100000
          calculateTransitionValue ] ] ] ]


  ask patches [ ;; Para la clase Media

    ifelse ((middle-class-neighbors <= 3 and high-class-neighbors >= 1) and is-middle-class?) ;; La clase alta cobrará impuestos

      [ set cell-income cell-income - 900000
        calculateTransitionValue ]

        [ ifelse ((low-class-neighbors >= 4) and is-middle-class?) ;; Se verá perjudicado si tiene muchos vecinos clase baja, hay caos y robos

          [ set cell-income cell-income - 600000
            calculateTransitionValue ]

          [ if ((middle-class-neighbors >= 4) and is-middle-class?) ;; Seguirá igual si su entorno es clase media

        [ set-cell-values ] ] ] ]


  ask patches [ ;; Para la clase Alta

    ifelse ((high-class-neighbors >= 5 or middle-class-neighbors >= 4) and is-high-class?) ;; Se beneficia si su entorno es mayormente clase alta

      [ set cell-income cell-income + 2500000
        set cell-services cell-services + 2
        set cell-education cell-education + 2
        calculateTransitionValue ]

    [ ifelse ((middle-class-neighbors >= 4 or low-class-neighbors >= 5) and is-high-class?) ;; Gana impuestos de sus vecinos de clase inferior

      [ set cell-income cell-income + 1100000
        calculateTransitionValue ][ifelse (store-neighbors >= 2)[
          set cell-services cell-services + 2
          calculateTransitionValue
        ]
        [ if ((low-class-neighbors <= 4) and is-high-class?) ;; Gana impuestos de los vecinos clase baja

          [ set cell-income cell-income + 1000000
            calculateTransitionValue ] ] ] ]]
end


;; Para asignar las clases a las celdas

to assign-class
  ask patches [
    if transition-value >= 30 [

      set is-low-class? false
      set is-middle-class? false
      set is-high-class? true
      set pcolor green

    ]

    if transition-value >= 20 and transition-value < 30 [

      set is-middle-class? true
      set is-low-class? false
      set is-high-class? false
      set pcolor yellow

    ]

    if transition-value < 20 and transition-value > 1 [

      set is-middle-class? false
      set is-low-class? true
      set is-high-class? false
      set pcolor red

    ]

    if transition-value = 0 [
      initialize-cell
    ]

    ;; Valores inalcanzables para que las celulas no se transformen en entidades

    if transition-value = -15 [
      assign-hospital
    ]
    if transition-value = -25 [
      assign-store
    ]
    if transition-value = -35 [
      assign-university
    ]
  ]

end


;; Para iniciar el modelo

to go

  assign-class
  update-neighbors-info

  ifelse(politica = "Normalidad")[transition-classes]
  [ifelse(politica = "Equidad")[transition-classes-taxes]
  [transition-classes-capitalism]]

  update-info-label
  tick

end