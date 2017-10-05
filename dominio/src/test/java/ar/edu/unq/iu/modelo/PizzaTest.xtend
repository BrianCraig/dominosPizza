package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test
import org.junit.Before

class PizzaTest {
    Ingrediente jamon
    Ingrediente queso
    Ingrediente aceitunas
    Ingrediente morron

    Pizza muzza
    Pizza jym


    @Before
    def void setUp(){
        jamon = new Ingrediente("jamon", 10.0)
        queso = new Ingrediente("queso", 14.0)
        aceitunas = new Ingrediente("aceitunas", 8.0)
        morron = new Ingrediente("morron", 20.0)
    }

    @Test
    def void UnaPizzaDeJamonYMorronesSale80PeTest(){
    	jym = new Pizza("Jamon y Morrones", 80.0) => [
            ingredientes.add(jamon)
            ingredientes.add(morron)
        ]
        Assert.assertEquals(jym.precio, 80.0, 0.0)
    }

    @Test
    def void UnaPizzaDeMuzzaSale70PeTest(){
    	muzza = new Pizza("Muzzarella", 70.0) => [
            ingredientes.add(queso)
        ]
        Assert.assertEquals(muzza.precio, 70.0, 0.0)
    }

    @Test
    def void LaGrandeDeMuzzaAumentoTest(){
    	muzza = new Pizza("Muzzarella", 70.0) => [
            ingredientes.add(queso)
        ]
        muzza.precio = 120
        Assert.assertEquals(muzza.precio, 120.0, 0.0)
    }
}