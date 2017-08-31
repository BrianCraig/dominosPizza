package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test

class PizzaTest {

    @Test
    def void UnaPizzaEsUnaPizza(){
        Assert.assertEquals(Pizza, Pizza);
    }
    
    @Test
    
    def void UnaPizzaDeJamonYMorrones(){
    	var jamon = new Ingrediente("jamon", 0.0)
    	var morrones = new Ingrediente("morron", 0.0)
    	var pizza = new Pizza("jamon y morrones", 75.0)
    	pizza.agregar(new Agregado(jamon, Cubre.Todo))
    	pizza.agregar(new Agregado(morrones, Cubre.Todo))
    	Assert.assertEquals(pizza.nombre, "jamon y morrones")
    }

}