'use strict';

class UsuarioService {
    constructor($http) {
        this.http = $http;
        this.usuario = undefined;
    }

    estaLogeado() {
        return this.usuario !== undefined;
    }

    ingresar(usuario) {
        return this.http.post("http://localhost:5500/ingreso", usuario)
            .then((request) => request.data)
            .then((data) => this.usuario = new Usuario(data))
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