'use strict';

class VerPedidoController {
    constructor($state,PedidoService) {
        this.$state = $state;
        this.pedidoS = PedidoService;
    }

    seleccionarTipoEnvio(unEnvio, unPrecio,unPedido){
        this.envio = new Envio({
            nombre:unEnvio,
            costo:unPrecio
        });
        unPedido.agregarTipoEnvio(this.envio)
    }

    agregarMasPlatos(){
        this.$state.go("seleccionarPizza")
    }
}

angular.module('dominosApp').component('verPedido', {
    templateUrl: '/app/verPedido/ver-pedido.component.html',
    controller: VerPedidoController,
    controllerAs: "controller"
});