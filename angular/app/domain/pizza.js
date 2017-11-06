'use strict';

// Faltan ingredientes

class Pizza {
    constructor(objeto) {
        angular.extend(this, objeto);
        this.ingredientes = this.ingredientes.map((i) => new Ingrediente(i)) // hydrate
    }
}