'use strict';

class SeleccionarPizzaController {
    constructor($state, UsuarioService) {
        this.usuarioS = UsuarioService;
        this.$state = $state;
    }
}

angular.module('dominosApp').component('seleccionarPizza', {
    templateUrl: '/app/seleccionarPizza/seleccionar-pizza.component.html',
    controller: SeleccionarPizzaController,
    controllerAs: "controller"
});