'use strict';

class ConfrmarPedidoController {
    constructor(PedidoService) {
        this.pedidoS = PedidoService;
    }
}

angular.module('dominosApp').component('confirmarPedido', {
    templateUrl: '/app/confirmarPedido/confirmar-pedido.component.html',
    controller: ConfirmarPedidoController,
    controllerAs: "controller"
});