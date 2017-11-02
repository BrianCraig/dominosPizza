'use strict';

class SeleccionarPizzaController {
    constructor($state, UsuarioService, PizzasService, TamanioService) {
        this.pizzasS = PizzasService;
        this.usuarioS = UsuarioService;
        this.tamanioS = TamanioService;
        this.$state = $state;
    }

    seleccionarPizza(unaPizza){
        this.pizzaSeleccionada = unaPizza;
        $('#seleccionarTamanio').modal('show')
    }

    seleccionarTamanio(unTamanio){
        this.platoSeleccionado = new Plato({
            pizza: this.pizzaSeleccionada,
            tamanio: unTamanio
        });
        $('#seleccionarTamanio').modal('hide').after(() =>{
            $('#seleccionarIngredientes').modal('show')
        })


    }
}

angular.module('dominosApp').component('seleccionarPizza', {
    templateUrl: '/app/seleccionarPizza/seleccionar-pizza.component.html',
    controller: SeleccionarPizzaController,
    controllerAs: "controller"
});