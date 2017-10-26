'use strict';

/* Servicio usado para el pedido para ser enviado */
class PedidoService {
    constructor() {
        this.plato = undefined; // plato para agregar al pedido
        this.pedido = new Pedido(); // pedido para ser enviado
    }

    elegirPizza(pizza){
        const plato = new Plato();
        plato.pizzas.push(plato);
        this.plato = plato;
    }

    agregarPizzaAPedido() {
        this.pedido.platos.push(this.plato);
        this.plato = undefined; //
    }

    comprar() {
        // TODO: hacemos el POST
        // agregamos el pedido a nuestro PedidosService
        this.pedido = new Pedido(); // reseteamos el servicio
        this.plato = undefined;
    }

}

angular.module('dominosApp').service('PedidoService', PedidoService);