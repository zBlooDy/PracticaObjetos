import personas.Persona.*

class Medico inherits Persona {

  const cantidadDosis

  method atenderA(unaPersona) {
    unaPersona.recibirMedicamento(cantidadDosis * 15)
  }
}