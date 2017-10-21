'use strict';

class IngresoController {
    constructor($state, UsuarioService) {
        this.$state = $state
        this.usuarioS = UsuarioService
        this.campos = {}
    }

    ingresar() {
        //verificacion de usuario
        this.usuarioS.ingresar(this.campos);
        this.$state.go("seleccionarPizza")
    }
}

angular.module('dominosApp').component('ingreso', {
    templateUrl: '/app/inicio/ingreso/ingreso.component.html',
    controller: IngresoController,
    controllerAs: "ingreso"
});