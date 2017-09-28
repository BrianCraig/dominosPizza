package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Pedido
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Plato
import ar.edu.unq.iu.modelo.TamanioChica
import ar.edu.unq.iu.modelo.TamanioFamiliar
import ar.edu.unq.iu.modelo.TamanioGrande
import ar.edu.unq.iu.modelo.TamanioPorcion
import ar.edu.unq.iu.repo.RepoPizza
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.TransactionalAndObservable

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