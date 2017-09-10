package ar.edu.unq.iu.modelo

import java.util.List

abstract class EstadoPedido {
    abstract def List<EstadoPedido> getPosiblesEstados()
}

// Todos los pedidos empiezan en estado preparando
class Preparando extends EstadoPedido {
    override def getPosiblesEstados (){
        #[new ListoParaEnviar, new ListoParaRetirar, new Cancelado]
    }
}

// Si es de delivery (ListoParaEnviar -> EnViaje -> Entregado)
class ListoParaEnviar extends EstadoPedido {
    override def getPosiblesEstados (){
        #[new Preparando, new EnViaje, new Cancelado]
    }
}

class EnViaje extends EstadoPedido {
    def override getPosiblesEstados (){
        #[new ListoParaEnviar, new Entregado, new Cancelado]
    }
}

class Entregado extends EstadoPedido{
    def override getPosiblesEstados (){
        #[]
    }
}

// Si es para retirar (ListoParaRetirar ->  Entregado)
class ListoParaRetirar extends EstadoPedido {
    def override getPosiblesEstados (){
        #[new Preparando, new Entregado, new Cancelado]
    }
}

// Se puede cancelar en cualquier estado menos Cancelado
class Cancelado extends EstadoPedido{
    def override getPosiblesEstados (){
        #[]
    }
}

class CambioDeEstadoException extends Exception {}