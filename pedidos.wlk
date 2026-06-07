class Pedido {
    var property distancia
    var property tiempoMax
    var property cantPasajerosATransportar
    const coloresIncompatibles = #{}   

    method acelerar() {tiempoMax-=1}
    method relajar() {tiempoMax+=1}
    method coloresIncompatibles() = coloresIncompatibles
    method agregarColorIncompatible(unColor) {coloresIncompatibles.add(unColor)}
    method sacarColorIncompatible(unColor) {
        if (coloresIncompatibles.contains(unColor)) 
            coloresIncompatibles.remove(unColor)}
    method velocidadRequerida() = distancia / tiempoMax
    method elAuto_PuedeHacerElPedido(unAuto) {
        return  self.autoCumpleVelocidad(unAuto) && self.autoCumpleCapacidad(unAuto) && self.autoNoEsCompatible(unAuto)
    }
    method autoCumpleVelocidad(unAuto) = unAuto.velocidadMax() >= self.velocidadRequerida() + 10  
    method autoCumpleCapacidad(unAuto) = unAuto.capacidad() >=  self.cantPasajerosATransportar()
    method autoNoEsCompatible(unAuto) = !coloresIncompatibles.contains(unAuto.color()) 
}

