'use strict';

class Pedido {
    constructor() {
        this.platos = []
    }

    precio() {
        // map y "sum" (con un reduce)
        return this.platos
            .map((plato) => plato.precio())
            .reduce((sum, x) => sum + x, 0);
    }

    agregarPlato(unPlato){
        this.platos.add(unPlato)
    }
}