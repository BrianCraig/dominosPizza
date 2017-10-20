'use strict';

class SeleccionarPizzaController {
    constructor($state) {
        this.$state = $state
    }
}

angular.module('dominosApp').component('seleccionarPizza', {
    templateUrl: '/app/seleccionarPizza/seleccionar-pizza.component.html',
    controller: SeleccionarPizzaController
});