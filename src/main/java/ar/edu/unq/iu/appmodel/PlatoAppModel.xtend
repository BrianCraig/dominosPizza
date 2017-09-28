package ar.edu.unq.iu.appmodel

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import java.io.Serializable

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.iu.modelo.TamanioChica
import ar.edu.unq.iu.modelo.TamanioGrande
import ar.edu.unq.iu.modelo.TamanioFamiliar
import ar.edu.unq.iu.modelo.TamanioPorcion
import org.uqbar.commons.applicationContext.ApplicationContext
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.repo.RepoPizza
import ar.edu.unq.iu.modelo.Plato
import org.uqbar.commons.model.annotations.Dependencies
import ar.edu.unq.iu.modelo.Pedido

@TransactionalAndObservable
@Accessors
class PlatoAppModel implements Serializable {
    Plato plato
    Pedido pedido

    new(Pedido pedido, Plato plato) {
        this.plato = plato
        this.pedido = pedido
    }

    def getRepoPizza() {
        ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza
    }

    def getTamanios() {
        #[new TamanioPorcion, new TamanioChica, new TamanioGrande, new TamanioFamiliar]
    }
}