package ar.edu.unq.iu.appmodel

import org.uqbar.commons.model.CollectionBasedRepo
import java.io.Serializable
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

/*
  creador y editor generico para un repo
*/

@Observable
@Accessors
class CrearEditarRepoModel<T extends CollectionBasedRepo> implements Serializable{
    T repo
    Entity seleccionado

    new(T repo){
        this.repo = repo
    }

    def objetos() {
        repo.objects
    }
}