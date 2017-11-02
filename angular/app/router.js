'use strict';

class AppConfig {
    constructor($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('inicio', {
                url: "/",
                template: "<inicio></inicio>"
            })
            .state('seleccionarPizza', {
                url: "/pedir",
                template: "<ver-pedido></ver-pedido><seleccionar-pizza></seleccionar-pizza>"
            })
            .state('editarUsuario', {
                    url: "/usuario",
                    template: "<editar-usuario></editar-usuario>"
            })
            .state('confirmarPedido', {
                url: "/confirmar",
                template: "<confirmar-pedido></confirmar-pedido>"
            });

        $urlRouterProvider.otherwise("/");
    }
}

angular.module("dominosApp").config(AppConfig);