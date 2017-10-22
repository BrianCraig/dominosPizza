'use strict';

class CabeceraController {
    constructor(UsuarioService) {
        this.usuarioS = UsuarioService;
    }
}

angular.module('dominosApp').component('cabecera', {
    templateUrl: '/app/cabecera/cabecera.component.html',
    controller: CabeceraController,
    controllerAs: "controller"
});