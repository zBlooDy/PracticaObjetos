import Persona.*

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