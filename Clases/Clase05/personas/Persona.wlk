class Persona {
  
  const enfermedades = []
  
  var temperatura
  var cantidadCelulas


  method contraerEnfermedad(unaEnfermedad) {
    enfermedades.add(unaEnfermedad)
  }

  method tiene(unaEnfermedad) = 
    enfermedades.contains(unaEnfermedad)

  method vivirUnDia() {
    enfermedades.forEach { enfermedad => enfermedad.afectar(self) }
  }

  method aumentarTemperatura(unosGrados) {
    temperatura = 45.min(temperatura + unosGrados)
  }

  method destruirCelulas(unaCantidad) {
    cantidadCelulas -= unaCantidad
  }

  method cantidadCelulasAfectadasPorEnfermedadesAgresivas() =
    enfermedades
      .filter { enfermedad => enfermedad.esAgresivaPara(self) }
      .sum { enfermedad => enfermedad.cantidadCelulasAmenazadas() }

  method cantidadCelulas() = cantidadCelulas

  method enfermedadQueMasCelulasAfecta() =
    enfermedades.max { enfermedad => enfermedad.cantidadCelulasAmenazadas() }

  method estaEnComa() = self.estaDelirando() || self.tienePocasCelulas()

  method estaDelirando() = temperatura == 45

  method tienePocasCelulas() = cantidadCelulas < 1000000

  method vivir(unosDias) {
    unosDias.times { _ => self.vivirUnDia() }
  }
  // El _ es por el hecho de que no me interesa la variable

  method recibirMedicamento(unaCantidad) {
    self.aplicarDosis(unaCantidad)
    self.removerCuradas()
  }

  method aplicarDosis(unaCantidad) {
    enfermedades.forEach {enfermedad => enfermedad.atenuarse(unaCantidad)}
  }

  method removerCuradas() { 
    enfermedades.removeAllSuchThat {enfermedad => enfermedad.estaCurada()}
  }

  // removeAllSuchThat saca todos los elementos de la lista que cumplen cierta condicion
}