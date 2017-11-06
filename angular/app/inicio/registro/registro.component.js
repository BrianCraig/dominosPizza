'use strict';

class RegistroController {
    constructor($state, UsuarioService) {
        this.$state = $state
        this.usuarioS = UsuarioService
        this.campos = {}
    }

    registrar() {
        this.usuarioS.registro(this.campos).then(
            () => this.$state.go("seleccionarPizza")
        ).catch(
            (request) => this.mostrarError(request.data.error)
        )
    }

    mostrarError(texto) {
        alert(texto)
    }
}

angular.module('dominosApp').component('registro', {
    templateUrl: '/app/inicio/registro/registro.component.html',
    controller: RegistroController,
    controllerAs:"controller"
});