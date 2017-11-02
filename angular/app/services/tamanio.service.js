class TamanioService {
    constructor() {
        this.objects = [
            {nombre: "Familiar", factor: 1.25},
            {nombre: "Grande", factor: 1},
            {nombre: "Chica", factor: 0.5},
            {nombre: "Porcion", factor: 0.25}
        ]
    }
}

angular.module('dominosApp').service('TamanioService', TamanioService);