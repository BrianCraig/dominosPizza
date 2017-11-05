'use strict';

class PizzasService extends Repo{
    constructor($http) {
        super($http, '/pizzas', Pizza);
    }
}

angular.module('dominosApp').service('PizzasService', PizzasService);