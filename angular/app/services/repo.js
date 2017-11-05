'use strict';


class Repo {
    constructor($http, resource, model){
        this.http = $http;
        this.resource = resource;
        this.model = model;
        this.objects = [];
        console.log(this);
        this.populate();
    }

    populate() {
        return this.http.get(this.resource)
            .then((request) => request.data)
            .then((data) => {
                for(const object of data){
                    this.objects.push(new this.model(object))
                }
            })
    }

    obtenerPorID(id){
        return this.objects.find((o) => o.id === id)
    }

}