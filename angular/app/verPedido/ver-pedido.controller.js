'use strict';

class VerPedidoController {
    constructor(PedidoService) {
        this.pedidoS = PedidoService;
    }
}

angular.module('dominosApp').component('verPedido', {
    templateUrl: '/app/verPedido/ver-pedido.component.html',
    controller: VerPedidoController,
    controllerAs: "controller"
});