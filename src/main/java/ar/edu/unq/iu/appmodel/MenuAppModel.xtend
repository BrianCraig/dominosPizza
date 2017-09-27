package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.repo.RepoIngrediente
import ar.edu.unq.iu.repo.RepoPizza
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class MenuAppModel implements Serializable {
    def RepoPizza getRepoPizza() {
        ApplicationContext.instance.getSingleton(Pizza) as RepoPizza
    }

    def RepoIngrediente getRepoIngrediente() {
        ApplicationContext.instance.getSingleton(Ingrediente) as RepoIngrediente
    }
}