;; POR HACER: Ajustar las reglas para que itere mejor y siga un patrón parecido al de Buga, ajustar sueldos, mejorar la interfaz gráfica e implementar la elección de reglas

globals [
  erasing?  
  policy  
]

patches-own [
  ingreso  ;; ingreso de la celda
  living?  ;; indica si la celula está viva
  clase  ;; clase de la celda: "baja", "media", "alta"
  universidad?  ;; indica si la celula es una U
  hospital?  ;; indica si la celula es un hospital
  tienda?  ;; indica si la celula es una tienda
  parque?  ;; indica si la celula es un parque maluco
  centro?  ;; indica si la celula es el centro (sería el centro 'comercial' de la ciudad)
  baja-neighbors  ;; cuantas celulas vecinas estan vivas de clase baja
  media-neighbors  ;; cuantas celulas vecinas estan vivas de clase media
  alta-neighbors  ;; cuantas celulas vecinas estan vivas de clase alta
  universidad-neighbors  ;; cuantas celulas vecinas son unis
  hospital-neighbors  ;; cuantas celulas vecinas son hospitales
  parque-neighbors  ;; cuantas celulas vecinas son parques 
  centro-neighbors  ;; cuantas celulas vecinas son centro
  tienda-neighbors  ;; cuantas celulas vecinas son tiendas
]

to setup-blank
  clear-all
  ask patches [ cell-death ]
  reset-ticks
end

to setup-random
  clear-all
  ;; Crear parques
  ask patches [
    ifelse random-float 100000.0 < initial-density
      [ cell-parque ]
      [ cell-death ]
  ]
  ;; Crear hospital
  ask patches with [not parque?] [
    ifelse random-float 90000.0 < initial-density
      [ cell-hospital ]
      [ cell-death ]
  ]
  ;; Crear universidad
  ask patches with [not parque? and not hospital?] [
    ifelse random-float 10000.0 < initial-density
      [ cell-universidad ]
      [ cell-death ]
  ]
  ;; Crear tiendas
  ask patches with [not parque? and not hospital? and not universidad?] [
    ifelse random-float 5000.0 < initial-density
      [ cell-tienda ]
      [ cell-death ]
  ]
  ;; Crear diferentes estratos
  ask patches with [not parque? and not hospital? and not universidad? and not tienda?] [
    let probabilidad random-float 100.0
    ;; Adjust probabilities for more balanced distribution
    ifelse probabilidad < 20  ;; Reduced probability for alta
      [ cell-alta ]
      [ ifelse probabilidad < 60  ;; Increased probability for media
        [ cell-media ]
        [ cell-baja ]  ;; Increased probability for baja
      ]
  ]
  ;; Poner la celda centro justo en el centro de la ciudad
  let center-x (max-pxcor + min-pxcor) / 2
  let center-y (max-pycor + min-pycor) / 2
  ask patch center-x center-y [ cell-centro ]
  reset-ticks
end



;; Resetear los estados de las celulas
to reset-cell
  set ingreso 0
  set clase ""
  set universidad? false
  set hospital? false
  set tienda? false
  set parque? false
  set centro? false
  set living? false
end

;; Definicion de las celulas
to cell-baja
  reset-cell
  set ingreso random-float 3000  ;; ejemplo de ingreso bajo
  set clase "baja"
  set living? true
  set pcolor brown
end

to cell-media
  reset-cell
  set ingreso 3000 + random-float 4000  ;; ejemplo de ingreso medio
  set clase "media"
  set living? true
  set pcolor blue
end

to cell-alta
  reset-cell
  set ingreso 7000 + random-float 5000  ;; ejemplo de ingreso alto
  set clase "alta"
  set living? true
  set pcolor green
end

to cell-universidad
  reset-cell
  set universidad? true
  set living? true
  set pcolor white
end

to cell-hospital
  reset-cell
  set hospital? true
  set living? true
  set pcolor red
end

to cell-tienda
  reset-cell
  set tienda? true
  set living? true
  set pcolor violet
end

to cell-parque
  reset-cell
  set parque? true
  set living? true
  set pcolor pink
end

to cell-centro
  reset-cell
  set centro? true
  set living? true
  set pcolor yellow
end

to cell-death
  reset-cell
  set living? false
  set pcolor black
end

;; Reglas de transicion de las celulas

to go
  ask patches [
    set baja-neighbors count neighbors with [clase = "baja"]
    set media-neighbors count neighbors with [clase = "media"]
    set alta-neighbors count neighbors with [clase = "alta"]
    set universidad-neighbors count neighbors with [universidad?]
    set hospital-neighbors count neighbors with [hospital?]
    set parque-neighbors count neighbors with [parque?]
    set centro-neighbors count neighbors with [centro?]
    set tienda-neighbors count neighbors with [tienda?]
  ]

;; Clase Baja
  ask patches [
    if clase = "baja" [
      if baja-neighbors > 4 [
        if parque-neighbors > 0 and random-float 1.0 < 0.2 [
          cell-tienda
        ]
      ]
      if hospital-neighbors > 0 or alta-neighbors >= 6 and random-float 1.0 < 0.5 [
        cell-alta
      ]
      if media-neighbors >= 4 [
        cell-media
      ]
      if parque-neighbors >= 2 and random-float 1.0 < 0.2 [
        cell-media
      ]
      if universidad-neighbors >= 1 and random-float 1.0 < 0.2 [
        cell-media
      ]
      if centro-neighbors = 1 and random-float 1.0 < 0.5 [
        cell-tienda
      ]
      
    ]
  ]

  ;; Clase Media
  ask patches [
    if clase = "media" [
      if universidad-neighbors > 0 and random-float 1.0 < 0.5 [
        cell-alta
      ] 
      if alta-neighbors >= 3 [
        cell-media
      ] 
      if alta-neighbors > 2 and random-float 1.0 < 0.5 [
        cell-baja
      ]
      if centro-neighbors > 0 and random-float 1.0 < 0.5 [
        cell-baja
      ]
      if tienda-neighbors >= 2 [
        cell-media
      ]
      if parque-neighbors >= 1 and random-float 1.0 < 0.3 [
        cell-baja
      ]
      if parque-neighbors > 0 and random-float 1.0 < 0.1 [
        cell-tienda
      ]
    ]
  ]

  ;; Clase Alta
  ask patches [
    if clase = "alta" [
      if universidad-neighbors > 0 or hospital-neighbors > 0 [
        cell-alta
      ] 
      if baja-neighbors >= 4 and random-float 1.0 < 0.5 [
        cell-media
      ] 
      if baja-neighbors > 4 and random-float 1.0 < 0.5 [
        cell-baja
      ]
      if tienda-neighbors >= 3 and random-float 1.0 < 0.2 [
        cell-media
      ]
    ]
  ]

  ;; Tienda
  ask patches [
    if tienda? [
      if media-neighbors >= 3 [
        cell-tienda
      ] 
      if baja-neighbors > 4 and random-float 1.0 < 0.5 [
        cell-baja
      ] 
      if tienda-neighbors > 7 and random-float 1.0 < 0.5 [
        cell-centro
      ]
      if parque-neighbors >= 2 [
        cell-tienda
      ]
    ]
  ]

  ;; Parques Recreativos
  ask patches [
    if parque? [
      if baja-neighbors = 3 and random-float 1.0 < 0.5 [
        ask neighbors [
          if not parque? [
            cell-baja
          ]
        ]
      ]
      if alta-neighbors >= 3 [
        cell-parque
      ]
    ]
  ]

  ;; Centros
  ask patches [
    if centro? [
      ask neighbors [
        if clase = "alta" and random-float 1.0 < 0.5 [
          cell-tienda
        ] 
        if clase != "alta" and random-float 1.0 < 0.5 [
          cell-baja
        ]
      ]
      if universidad-neighbors >= 3 [
        cell-centro
      ]
    ]
  ]

  tick
end

to draw-cells
  ifelse mouse-down? [
    if erasing? = 0 [
      set erasing? [living?] of patch mouse-xcor mouse-ycor
    ]
    ask patch mouse-xcor mouse-ycor [
      ifelse erasing? [
        cell-death
      ] [
        cell-alta
      ]
    ]
    display
  ] [
    set erasing? 0
  ]
end
