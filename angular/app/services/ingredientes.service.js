'use strict';

class IngredientesService extends Repo{
    constructor($http) {
        super($http, '/ingredientes', Ingrediente);
    }
}

angular.module('dominosApp').service('IngredientesService', IngredientesService);