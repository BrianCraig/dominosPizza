'use strict';

class SeleccionarPizzaController {
    constructor($state, UsuarioService, PizzasService, TamanioService) {
        this.pizzasS = PizzasService;
        this.usuarioS = UsuarioService;
        this.tamanioS = TamanioService;
        this.$state = $state;
    }

    abrirPizza(unaPizza){
        this.pizzaSeleccionada = unaPizza;
        $('#editarPizza').modal('show')
    }
}

angular.module('dominosApp').component('seleccionarPizza', {
    templateUrl: '/app/seleccionarPizza/seleccionar-pizza.component.html',
    controller: SeleccionarPizzaController,
    controllerAs: "controller"
});