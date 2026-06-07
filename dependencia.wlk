import vehiculos.*
import pedidos.*


class Dependencia {
    const flotaRodados = []
    var empleados
    const pedidos = []

    method cantEmpleados() = empleados
    method cambiarCantEmpleados(cantidad) {empleados = cantidad}
    method esParteDeLaFlota(unRodado) = flotaRodados.contains(unRodado) 
    method agregarAFlota(unRodado) {
        if (!self.esParteDeLaFlota(unRodado))
            flotaRodados.add(unRodado)
    }
    method quitarDeFlota(unRodado) {
        if (self.esParteDeLaFlota(unRodado))
            flotaRodados.remove(unRodado)
    }
    method pesoTotalFlota() = flotaRodados.sum{f => f.peso()}
    method estaBienEquipada() = flotaRodados.size() >= 3 && flotaRodados.all{f => f.velocidadMax() >= 100} 
    method capacidadTotalEnColor(unColor) = self.rodadosColor(unColor).sum{r => r.capacidad()} 
    method rodadosColor(unColor) = flotaRodados.filter{f => f.color() == unColor} 
    method colorDelRodadoMasRapido() = flotaRodados.max{f => f.velocidadMax()}.color()
    method capacidadFaltante() = empleados - self.capacidadFlota() 
    method capacidadFlota() = flotaRodados.sum{f => f.capacidad()} 
    method esGrande() = (empleados >= 40) && (flotaRodados.size() >= 5)
    method registroPedidos() = pedidos 
    method agregarPedido(unPedido) {
      pedidos.add(unPedido)
    }
    method quitarPedido(unPedido) {
        if (pedidos.contains(unPedido))
            pedidos.remove(unPedido)
    }
    method totalPasajerosEnPedidosRegistrados() = pedidos.sum{r => r.cantPasajerosATransportar()} 
    method pedidosNoSatisfechos() = pedidos.filter {p => flotaRodados.none { a => p.elAuto_PuedeHacerElPedido(a)}}
    method elColor_EsIncompatibleConTodosLosPedidos(color) =  pedidos.all{p => p.coloresIncompatibles().contains(color)}
    method relajar() {pedidos.map{p => p.relajar()}}
}

