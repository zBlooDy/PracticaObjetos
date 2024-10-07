class Enfermedad {
  var property celulasAmenazadas = 1

  method atenuarse(cantidadCelulas) {
    celulasAmenazadas = 0.max(celulasAmenazadas - cantidadCelulas)
  }

  method agravarse(cantidadCelulas) {
    celulasAmenazadas = celulasAmenazadas + cantidadCelulas
  }

}

class EnfermedadInfecciosa inherits Enfermedad {

  method afectarA(persona) {
    persona.aumentarTemperatura(self.celulasAmenazadas() / 1000)
  }

  method reproducirse() {
    celulasAmenazadas = celulasAmenazadas * 2
  }

  method esAgresivaPara(persona) = self.celulasAmenazadas() > persona.cantidadCelulas() * 0.1
}

class EnfermedadAutoInmune inherits Enfermedad {

  var diasAfectados = 0

  method afectarA(persona) {
    persona.destruirCelulas(self.celulasAmenazadas())
    diasAfectados += 1
  }

  method esAgresivaPara(persona) = diasAfectados > 30

}

class Persona {
  var temperatura
  var cantidadCelulas 
  const property enfermedades = #{} 


  method aumentarTemperatura(grados) {
    temperatura = 45.min(temperatura + grados)
  }

  method destruirCelulas(celulas) {
    cantidadCelulas = 0.max(cantidadCelulas - celulas)
  } 

  method contraer(enfermedad) {
    enfermedades.add(enfermedad)
  }

  method pasarDia() {
    enfermedades.forEach{enfermedad => enfermedad.afectarA(self)}
  }

  method pasarDias(dias) {
    dias.times {dia => self.pasarDia()}
  }

  method tiene(enfermedad) {
    return enfermedades.contains(enfermedad)
  }

  method estaEnComa() {
    temperatura == 45 or cantidadCelulas < 1000000
  }

  
}


