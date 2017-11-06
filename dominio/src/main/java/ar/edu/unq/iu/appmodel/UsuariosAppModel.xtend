package ar.edu.unq.iu.appmodel

import ar.edu.unq.iu.modelo.Cliente
import ar.edu.unq.iu.repo.RepoCliente
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

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
    
    def clienteConId(String id){
    	maybeClienteConId(Integer.parseInt(id)).get().pedidos
    }
    
    def private maybeClienteConId(Integer id){
    	clientes.stream().filter([ cli | cli.id == id]).findFirst()
    }
    
    def createCliente(String nombre, String nick, String pass, String mail, String direccion) {
    	repoCliente.create(nombre, nick, pass, mail, direccion)
    }
    
    def private maybeClienteCon(String nick, String password){
    	clientes.stream().filter([ cli | cli.nick == nick && cli.password == password]).findFirst()
    }
    
    def private requerimientosPass(String pass){
    	(pass.nullOrEmpty || pass.length<6)
    }
    
    def private requerimientosMail(String mail){
    	(mail.nullOrEmpty || !mail.contains("@") || !mail.contains(".com"))
    }
    
    def datosCorrectos(String nombre, String nick, String pass, String mail, String direccion){
    	return !(nombre.nullOrEmpty || nick.nullOrEmpty || direccion.nullOrEmpty || requerimientosPass(pass) || requerimientosMail(mail))
    }
}