'use strict';

class IngresoController {
    constructor($state) {
        this.$state = $state
    }

    ingresar() {
        //verificacion de usuario
        this.$state.go("seleccionarPizza")
    }
}

angular.module('dominosApp').component('ingreso', {
    templateUrl: '/app/inicio/ingreso/ingreso.component.html',
    controller: IngresoController,
    controllerAs: "ingreso"
});