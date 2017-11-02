'use strict';

/* Servicio usado para el pedido para ser enviado */
class PedidoService {
    constructor() {
        this.pedido = new Pedido(); // pedido para ser enviado
    }

    agregarPlato(unPlato) {
        this.pedido.platos.push(unPlato);
    }

    comprar() {
        // TODO: hacemos el POST
        // agregamos el pedido a nuestro PedidosService
        this.pedido = new Pedido(); // reseteamos el servicio
    }

    tienePlatos() {
        return this.pedido.platos.length !== 0;
    }

}

angular.module('dominosApp').service('PedidoService', PedidoService);