'use strict';

class UsuarioService {
    constructor($http) {
        this.http = $http;
        this.usuario = null;
    }

    estaLogeado() {
        return this.usuario !== null;
    }

    ingresar(usuario) {
        return this.http.post("http://localhost:5500/ingreso", usuario)
            .then((request) => request.data)
            .then((data) => this.usuario = new Usuario(data))
    }

    registro(usuario) {
        return this.http.post("http://localhost:5500/usuarios", usuario)
            .then((request) => request.data)
            .then((data) => this.usuario = new Usuario(data))
    }

    salir() {
        this.usuario = null;
    }
}

angular.module('dominosApp').service('UsuarioService', UsuarioService);