class Corsa {
  var color

  method capacidad() = 4
  method velocidadMax() = 150
  method color() = color
  method cambiarColor(nuevoColor) {color = nuevoColor}
  method peso() = 1300

}

class Kwid {
  var tanqueAd = false
  const property pesoTanque = 150 

  method capacidad(){
    if (tanqueAd)  
      return 3 
    else
      return 4
  }
  method velocidadMax(){
    if (tanqueAd)  
      return 120
    else
      return 110
  }
  method color() = "Azul"
  method peso() = 1200 + pesoTanque
  method ponerTanque() {tanqueAd = true}
  method sacarTanque() {tanqueAd = true}
}

class Trafic{
  var interior = comodo
  var motor = polenta
  method cambiarInterior() {
    interior = interior.opuesto()
  }
  method cambiarMotor(){
    motor = motor.opuesto()
  }
  method capacidad() = interior.capacidad()
  method velocidadMax() = motor.velocidadMax()  
  method peso() = 4000 + interior.peso() + motor.peso() 
  method color() = "Blanco"
}

//MOTORES
object polenta{
  method peso() = 800
  method velocidadMax() = 130  
  method opuesto() = bataton 
}

object bataton {
  method peso() = 500
  method velocidadMax() = 80  
  method opuesto() = polenta 
}

//INTERIORES
object comodo {
  method capacidad() = 5
  method peso() = 700  
  method opuesto() = popular 
}

object popular {
  method capacidad() = 12
  method peso() = 1000 
  method opuesto() = comodo 
}