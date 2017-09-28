package ar.edu.unq.iu.appmodel

import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

/*
  creador y editor generico para un repo
*/

@Observable
@Accessors
class CrearEditarRepoModel<T extends Entity> implements Serializable{
    CollectionBasedRepo<T> repo
    T seleccionado

    new(CollectionBasedRepo<T> repo){
        this.repo = repo
    }

    def objetos() {
        repo.objects
    }

    def actualizar(){
        ObservableUtils.firePropertyChanged(this, "objetos")
    }
}