'use strict';

class TamanioService extends Repo {
    constructor($http) {
        super($http, '/tamanios', Tamanio);
    }
}

angular.module('dominosApp').service('TamanioService', TamanioService);