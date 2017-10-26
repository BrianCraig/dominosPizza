'use strict';

var mockPizzas = `[ {
  "id" : 1,
  "nombre" : "Jamon y Morrones",
  "ingredientes" : [ {
    "id" : 3,
    "nombre" : "Jamon",
    "precio" : 3.5
  }, {
    "id" : 2,
    "nombre" : "Morrones",
    "precio" : 3.5
  }, {
    "id" : 4,
    "nombre" : "Queso",
    "precio" : 1.0
  } ],
  "precio" : 50.0
}, {
  "id" : 2,
  "nombre" : "Panceta",
  "ingredientes" : [ {
    "id" : 1,
    "nombre" : "Panceta",
    "precio" : 5.0
  }, {
    "id" : 4,
    "nombre" : "Queso",
    "precio" : 1.0
  } ],
  "precio" : 60.0
} ]`; // lo que nos viene del get /pizzas


class PizzasService {
    constructor() {
        this.objects = [];
        this.poblar();
    }

    obtenerPorID(id){
        return this.objects.find((o) => o.id === id)
    }

    poblar() {
        for(const pizza of JSON.parse(mockPizzas)){
            this.objects.push(new Pizza(pizza))
        }
    }
}

angular.module('dominosApp').service('PizzasService', PizzasService);