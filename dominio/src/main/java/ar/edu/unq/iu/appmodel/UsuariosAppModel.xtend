package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.repo.RepoIngrediente
import ar.edu.unq.iu.repo.RepoPizza
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.unq.iu.modelo.Cliente
import ar.edu.unq.iu.repo.RepoCliente

@Observable
@Accessors
class UsuariosAppModel implements Serializable {
    def RepoCliente getRepoCliente() {
        ApplicationContext.instance.getSingleton(Cliente) as RepoCliente
    }
    
    def getClientes() {
    	repoCliente.objects
    }
}