object tom {
  var energia = 80

  var posicion = 0
  
  method velocidad() {
    return 5 + energia / 10 
  } 

  method correrA(unRaton) {
    self.perderEnergiaPor(unRaton)
  }

  method perderEnergiaPor(unRaton) {
    energia = 0.max(energia - (0.5 * self.velocidad() * self.distancia(unRaton))) // Para que no haya energia negativa 😛
    
  }

  method distancia(unRaton) {
    return unRaton.posicion() - posicion
  }

  method esMasVeloz(unRaton) {
    self.velocidad() > unRaton.velocidad()
  }

}

object jerry {
  var peso = 3

  var posicion = 10

  method velocidad() {
    return 10 - peso
  }

}

object robotRaton {

  method velocidad() = 8
}