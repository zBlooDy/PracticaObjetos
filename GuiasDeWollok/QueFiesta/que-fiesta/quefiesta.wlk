object manic {
  var estrellas = 5
  var globos = 59

  method encontrar() {
    estrellas = estrellas + 8
  }

  method regalar() {
    estrellas = 0.max(estrellas - 1)
  }

  method tieneListo() {
    return estrellas >= 4
  }
  
  method tieneGlobos() {
    globos > 50
  }

  method comprarGlobos(cantidad) {
    globos = globos + cantidad
  }

}

object chuy {
  var globos = 30
  
  method comprarGlobos(cantidad) {
    globos = globos + cantidad
  }

  method tieneListo() {
    return true
  }

  method tieneGlobos() {
    globos > 50
  }
}

object capy {
  var latas = 30
  var globos = 50

  method recolectar() {
    latas = latas + 1
  }

  method reciclar() {
    latas = 0.max(latas - 5)
  }

  method tieneListo() {
    latas.even()
  }

  method tieneGlobos() {
    globos > 50
  }
  
  method comprarGlobos(cantidad) {
    globos = globos + cantidad
  }
}


object fiesta {
  var organizador = manic

  method estaPreparada() {
    organizador.tieneListo() && organizador.tieneGlobos()
  }
}