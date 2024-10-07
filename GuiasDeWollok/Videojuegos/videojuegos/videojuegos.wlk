object delfina {
  
  var diversion = 0
  var consola = play

  method agarrar(nuevaConsola) {
    consola = nuevaConsola
  }

  method jugar(videojuego) {
    diversion = diversion + videojuego.diversion(consola)
    consola.usar()
  }

  method diversion() = diversion

}

// <-- Consolas --> 

object play {

  method jugabilidad() = 10

  method usar() {}

}

object portatil {

  var bateriaBaja = false

  method jugabilidad() {
    if(bateriaBaja) {
      return 1
    } else {
      return 8
    }
  }

  method usar() {
    bateriaBaja = true
  }
  
}


// <-- Videojuegos --> 

object arkanoid {
  
  method diversion(_consola) = 50

}

object mario {
  
  method diversion(consola) {
    if(consola.jugabilidad() > 5) {
      return 100
    } else {
      return 15
    }
  }

}

object pokemon {

  method diversion(consola) {
    return 10 * consola.jugabilidad()
  }

}
