'use strict';

class Ingrediente {
    constructor(objeto) {
        this.id = objeto.id;
        this.nombre = objeto.nombre;
        this.precio = objeto.precio;
    }

    precioDoble() {
        return this.precio * 2 ;
    }
}