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

  method morir() {
    temperatura = 0
  }

  method temperatura() = temperatura
}

class Medico inherits Persona {

  const cantidadDosis

  method atenderA(unaPersona) {
    unaPersona.recibirMedicamento(cantidadDosis * 15)
  }

  override method contraerEnfermedad(unaEnfermedad) {
    super(unaEnfermedad)
    self.atenderA(self)
  }
}

class JefeDepartamento inherits Medico(cantidadDosis = 0) {

  const subordinados = []

  override method atenderA(unaPersona) {
    subordinados.anyOne().atenderA(unaPersona)
  }


  method subordinar(unaPersona) {
    subordinados.add(unaPersona)
  }
}

// Jefe de Departamento es medico por el hecho de que tiene la interfaz de medico (atender personas)

// Si pondria inherits Medico vamos a tener que definirle una dosis 

// Si heredo de Persona ==> Tengo que redefinir contraerPersona porque soy medico

// Si heredo de Medico ==> No uso la dosis

// En el paradigma me importa mas el COMPORTAMIENTO (no repetirlo, etc) entonces conviene heredar de Medico