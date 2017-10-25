'use strict';

var mockIngredientes = `[ {
  "id" : 1,
  "nombre" : "Panceta",
  "precio" : 5.0
}, {
  "id" : 2,
  "nombre" : "Morrones",
  "precio" : 3.5
}, {
  "id" : 3,
  "nombre" : "Jamon",
  "precio" : 3.5
}, {
  "id" : 4,
  "nombre" : "Queso",
  "precio" : 1.0
} ]`; // lo que nos viene del get /ingredientes


class IngredientesService {
    constructor() {
        this.objects = [];
        this.poblar(); // necesitamos ponerle los ingredientes
    }

    obtenerPorID(id){
        return this.objects.find((o) => o.id === id)
    }

    poblar() {
        for(const ing of JSON.parse(mockIngredientes)){
            this.objects.push(new Ingrediente(ing))
        }
    }
}

angular.module('dominosApp').service('IngredientesService', IngredientesService);