'use strict';

class VerPedidoController {
    constructor($state,PedidoService) {
        this.$state = $state;
        this.pedidoS = PedidoService;
    }

}

angular.module('dominosApp').component('verPedido', {
    templateUrl: '/app/verPedido/ver-pedido.component.html',
    controller: VerPedidoController,
    controllerAs: "controller"
});