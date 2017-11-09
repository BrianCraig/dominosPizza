'use strict';

class IngresoController {
    constructor($state, UsuarioService) {
        this.$state = $state;
        this.usuarioS = UsuarioService;
        this.campos = {}
    }

    ingresar() {
        this.usuarioS.ingresar(this.campos).then(
            () => this.$state.go("seleccionarPizza")
        ).catch(
            (request) => this.mostrarError(request.data.error)
        )
    }

    mostrarError(texto) {
        alert(texto)
    }
}

angular.module('dominosApp').component('ingreso', {
    templateUrl: '/app/inicio/ingreso/ingreso.component.html',
    controller: IngresoController,
    controllerAs: "ingreso"
});