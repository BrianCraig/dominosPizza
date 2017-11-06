'use strict';

class Usuario {
    constructor(objeto) {
        this.id = objeto.id;
        this.nick = objeto.nick;
        this.password = objeto.password;
        this.nombre = objeto.nombre;
        this.direccion = objeto.direccion;
        this.mail = objeto.mail;
    }
}