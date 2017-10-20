'use strict';

var AppConfig = class {
    constructor($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('inicio', {
                url: "/",
                template: "<ingreso></ingreso>"
            });

        $urlRouterProvider.otherwise("/");
    }
}

angular.module("dominosApp").config(AppConfig);