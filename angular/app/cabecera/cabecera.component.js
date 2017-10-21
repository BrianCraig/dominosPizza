'use strict';

class CabeceraController {
    constructor($state, UsuarioService) {
        this.usuarioS = UsuarioService;
        this.$state = $state;
    }
}

angular.module('dominosApp').component('cabecera', {
    templateUrl: '/app/cabecera/cabecera.component.html',
    controller: CabeceraController,
    controllerAs: "controller"
});