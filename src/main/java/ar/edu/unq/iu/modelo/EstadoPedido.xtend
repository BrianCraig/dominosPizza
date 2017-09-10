package ar.edu.unq.iu.modelo

import java.util.List
import java.util.ArrayList

abstract class EstadoPedido {
    abstract def List<EstadoPedido> posiblesEstados(Pedido p)
}

// Todos los pedidos empiezan en estado preparando
class Preparando extends EstadoPedido {
    override def posiblesEstados (Pedido p){
        val List<EstadoPedido> lista = new ArrayList()
        lista.add(new Cancelado)
        if(p.envio.class == Delivery) lista.add(new ListoParaEnviar)
        if(p.envio.class == Retirar) lista.add(new ListoParaRetirar)
        lista
    }
}

// Si es de delivery (ListoParaEnviar -> EnViaje -> Entregado)
class ListoParaEnviar extends EstadoPedido {
    override def posiblesEstados (Pedido p){
        #[new Preparando, new EnViaje, new Cancelado]
    }
}

class EnViaje extends EstadoPedido {
    def override posiblesEstados (Pedido p){
        #[new ListoParaEnviar, new Entregado, new Cancelado]
    }
}

class Entregado extends EstadoPedido{
    def override posiblesEstados (Pedido p){
        #[]
    }
}

// Si es para retirar (ListoParaRetirar ->  Entregado)
class ListoParaRetirar extends EstadoPedido {
    def override posiblesEstados (Pedido p){
        #[new Preparando, new Entregado, new Cancelado]
    }
}

// Se puede cancelar en cualquier estado menos Cancelado
class Cancelado extends EstadoPedido{
    def override posiblesEstados (Pedido p){
        #[]
    }
}

class CambioDeEstadoException extends Exception {}