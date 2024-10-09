import Medico.*

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