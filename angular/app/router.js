'use strict';

class AppConfig {
    constructor($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('inicio', {
                url: "/",
                template: "<inicio></inicio>"
            });

        $urlRouterProvider.otherwise("/");
    }
}

angular.module("dominosApp").config(AppConfig);