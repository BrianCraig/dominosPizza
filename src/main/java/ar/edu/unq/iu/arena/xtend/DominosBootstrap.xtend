package ar.edu.unq.iu.arena.xtend

import ar.edu.unq.iu.modelo.Agregado
import ar.edu.unq.iu.modelo.Cancelado
import ar.edu.unq.iu.modelo.Cliente
import ar.edu.unq.iu.modelo.Delivery
import ar.edu.unq.iu.modelo.EnViaje
import ar.edu.unq.iu.modelo.Entregado
import ar.edu.unq.iu.modelo.Ingrediente
import ar.edu.unq.iu.modelo.LadoIzquierdo
import ar.edu.unq.iu.modelo.Menu
import ar.edu.unq.iu.modelo.Pedido
import ar.edu.unq.iu.modelo.Pizza
import ar.edu.unq.iu.modelo.Plato
import ar.edu.unq.iu.modelo.Retirar
import ar.edu.unq.iu.modelo.TamanioFamiliar
import ar.edu.unq.iu.modelo.TamanioPorcion
import ar.edu.unq.iu.repo.RepoCliente
import ar.edu.unq.iu.repo.RepoIngrediente
import ar.edu.unq.iu.repo.RepoPedido
import ar.edu.unq.iu.repo.RepoPizza
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext

class DominosBootstrap extends CollectionBasedBootstrap {
	
	new(){
		 
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedido)
		ApplicationContext.instance.configureSingleton(typeof(Cliente), new RepoCliente)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngrediente)
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizza)
	}
	
	
	override run() {
		
		val repoPedido = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedido
		val repoIngrediente = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngrediente
		val repoCliente = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoCliente
		val repoPizza = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizza

		val panceta = repoIngrediente.create("Panceta", 5.0)
        val morrones = repoIngrediente.create("Morrones", 3.5)
        val jamon = repoIngrediente.create("Jamon", 3.5)
        val queso = repoIngrediente.create("Queso", 1.0)
        
        

        val jym = new Pizza("Jamon y Morrones", 50.0) => [
            agregarIngrediente(jamon)
            agregarIngrediente(morrones)
            agregarIngrediente(queso)
        ]
        val pizzaPanceta = new Pizza("Panceta", 60.0) => [
            agregarIngrediente(panceta)
            agregarIngrediente(queso)
            
        ]
        
        repoPizza => [
        	create(jym)
        	create(pizzaPanceta)
        ]

        val plato1 = new Plato(jym, new TamanioPorcion) => [
            agregados.add(new Agregado(morrones, new LadoIzquierdo))
        ]

        val plato2 = new Plato(pizzaPanceta, new TamanioFamiliar)

        val micaela = repoCliente.create("Micaela", "Mica", "password01", "mail01", "direccion01")
        val luciana = repoCliente.create("Luciana", "Luli", "password02", "mail02", "direccion02")
        val daniel = repoCliente.create("Daniel", "Dani", "password03", "mail03", "direccion03")
        val brian = repoCliente.create("Brian", "Bri", "password04", "mail04", "direccion04")
        val extra = repoCliente.create("Extra", "e", "password05", "mail05", "direccion05")

        val pedidoM = new Pedido (micaela, new Delivery(micaela.direccion)) => [
        	platos.add(plato1)
        	platos.add(plato2)
        ]
        val pedidoL = new Pedido (luciana, new Delivery(luciana.direccion)) => [
        	estado = new EnViaje()
        	platos.add(plato2)
        ]
        val pedidoD = new Pedido(daniel, new Retirar) => [
        	estado = new Cancelado()
        	platos.add(plato1)
        ]
        val pedidoB = new Pedido(brian, new Delivery(brian.direccion)) => [
        	estado = new Entregado()
        	platos.add(plato1)
        ]
        val pedidoE = new Pedido(extra, new Retirar) => [
        	platos.add(plato1)
        ]
        
        repoPedido => [
        	create(pedidoM)
        	create(pedidoL)
        	create(pedidoD)
        	create(pedidoB)
        	create(pedidoE)
        ]

        val menu = new Menu => [
            agregarIngredienteExtra(panceta)
            agregarIngredienteExtra(morrones)
            agregarIngredienteExtra(jamon)

            agregarPizza(jym)
            agregarPizza(pizzaPanceta)
        ]
		
	}
	
}