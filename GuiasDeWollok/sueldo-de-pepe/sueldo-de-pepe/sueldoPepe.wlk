object pepe {
  var categoria = gerente
  var faltas = 1
  var resultados = bonoNeto

  method neto() {
    return categoria.sueldo()
  }

  method bonoPresentismo() {
    if(faltas == 0) {
      return 100
    } else if (faltas == 1){
      return 50
    } else {
      return 0
    }
  }

  method sueldo() {
    return self.neto() + self.bonoPresentismo() + resultados.bono()
  }

  method categoria(nuevaCategoria) {
    categoria = nuevaCategoria
  }

  method faltas(nuevasFaltas) {
    faltas = nuevasFaltas
  }

  method resultados(nuevoResultado) {
    resultados = nuevoResultado
  }

}

object gerente {
  var neto = 1000

  method sueldo() {
    return neto
  }
}

object cadete {
  var neto = 1500

  method sueldo() {
    return neto
  }
}

object bonoNeto {
  
  method bono() {
    return 0.1 * pepe.neto()
  }
}

object bonoFijo {
  
  method bono() {
    return 80
  }
}

object bonoVacio {
  
  method bono() {
    return 0
  }
}