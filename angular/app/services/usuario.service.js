'use strict';

class UsuarioService {
    constructor() {
        this.usuario = undefined; // sin usuario logeado
    }

    estaLogeado() {
        return this.usuario !== undefined;
    }

    ingresar(usuario) {
        //MOCK
        usuario.direccion = "Calle falsa 123"
        usuario.id = 1
        usuario.email = "mock@mock.com"
        usuario.nombre = "Juan Perez"
        this.usuario = new Usuario(usuario)
    }

    registro(usuario) {
        //MOCK
        this.usuario = new Usuario(usuario)
    }

    salir() {
        this.usuario = undefined;
    }
}

angular.module('dominosApp').service('UsuarioService', UsuarioService);