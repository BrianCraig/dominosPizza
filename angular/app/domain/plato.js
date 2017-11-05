'use strict';

// Faltan ingredientes

class Plato {
    constructor(objeto) {
        this.id = objeto.id;
        this.pizza = objeto.pizza;
        this.tamanio = objeto.tamanio;
    }

    precio() {
        return this.pizza.precio * this.tamanio.precio;
    }
}