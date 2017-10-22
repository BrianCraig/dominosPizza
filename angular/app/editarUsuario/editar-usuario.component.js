'use strict';

class EditarUsuarioController {
    constructor(UsuarioService) {
        this.usuarioS = UsuarioService;
    }
}

angular.module('dominosApp').component('editarUsuario', {
    templateUrl: '/app/editarUsuario/editar-usuario.component.html',
    controller: EditarUsuarioController,
    controllerAs: "controller"
});