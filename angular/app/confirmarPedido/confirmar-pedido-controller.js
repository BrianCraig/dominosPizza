'use strict';

class ConfirmarPedidoController {
    constructor($state, PedidoService, UsuarioService) {
        this.$state = $state;
        this.pedidoS = PedidoService;
        this.usuarioS = UsuarioService
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

    realizarPedido(){
        this.usuarioS.usuario.agregarPedido(this.pedidoS.pedido);
        this.pedidoS.comprar()
    }

    editarUsuario(){
        this.$state.go("editarUsuario")
    }
}

angular.module('dominosApp').component('confirmarPedido', {
    templateUrl: '/app/confirmarPedido/confirmar-pedido.component.html',
    controller: ConfirmarPedidoController,
    controllerAs: "controller"
});