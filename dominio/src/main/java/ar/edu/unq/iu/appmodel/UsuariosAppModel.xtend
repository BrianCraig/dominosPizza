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
    
    def existeClienteCon(String nick, String password){
    	maybeClienteCon(nick, password).isPresent()
    }
    
    def clienteCon(String nick, String password){
    	maybeClienteCon(nick, password).get()
    }
    
    def private maybeClienteCon(String nick, String password){
    	clientes.stream().filter([ cli | cli.nick == nick && cli.password == password]).findFirst()
    }
}