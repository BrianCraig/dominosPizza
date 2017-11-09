'use strict';

class EditarUsuarioController {
    constructor($state, UsuarioService) {
        this.$state = $state;
        this.usuarioS = UsuarioService;
    }

    editarNick(){
        $('#ediarNick').modal('show')
    }

    editarNombre(){
        $('#ediarNombre').modal('show')
    }

    editarMail(){
        $('#ediarMail').modal('show')
    }

    editarDireccion(){
        $('#editarDireccion').modal('show')
    }

    editarContrasenia(){
        $('#editarContrasenia').modal('show')
    }

    aceptar(){
        () => this.$state.go("seleccionarPizza")
    }
}

angular.module('dominosApp').component('editarUsuario', {
    templateUrl: '/app/editarUsuario/editar-usuario.component.html',
    controller: EditarUsuarioController,
    controllerAs: "controller"
});