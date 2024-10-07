class Enfermedad {
  var cantidadCelulasAmenazadas

  method atenuarse(unaCantidad) {
    cantidadCelulasAmenazadas -= unaCantidad
  }

  method afectar(unaPersona) // Hace a la clase abstracta

  method estaCurada() = cantidadCelulasAmenazadas <= 0
}


// Como tuve comportamiento repetido (atenuarse) entre enfermedad infecciosa y autoinmune, entonces necesite "cosificar" a esta interfaz conocida como Enfermedad.

// Como quiero que no se puede instanciar esta clase ==> Defino a la clase como "abstracta"

// Para indicar que una clase es abstracta en wollok, tengo que poner un metodo vacio (sin llaves ni =)

// Enfermedad : Super Clase
//    |
// ------------------------------
// |                            |
// EnfermedadInfecciosa   EnfermedadInmune