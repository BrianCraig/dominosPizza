'use strict';

// Faltan ingredientes

class Pizza {
    constructor(objeto) {
        this.id = objeto.id;
        this.nombre = objeto.nombre;
        this.precio = objeto.precio;
        // los ingredientes tienen que ser relacionados,
        // ya que proablemente llegue una lista de id's, o quizás una lista de objetos
        // con el nombre y su valor y su id, y con un IngredientesService deberiamos obtener
        // el objeto mediante el id, y guardarlo acá
    }
}