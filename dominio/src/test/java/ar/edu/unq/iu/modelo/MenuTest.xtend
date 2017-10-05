package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test
import org.junit.Before

class MenuTest {
	
	Menu menu
	Pizza pizza1
	Pizza pizza2
	Ingrediente panceta
	Ingrediente aceitunas
	
	@Before
	def void setUp(){
		menu = new Menu()
		pizza1 = new Pizza("Jamon y Morrones", 0.0)
		pizza2 = new Pizza("Panceta", 0.0)
		panceta = new Ingrediente("Panceta", 5.0)
		aceitunas = new Ingrediente("Aceitunas", 3.5)
	}
	
	@Test
    def void testAgregaUnaPizzaAlMenu(){    	
    	menu.agregarPizza(pizza1)
        
        Assert.assertEquals(menu.cantidadDePizzas(), 1)
        Assert.assertTrue(menu.tienePizza(pizza1))
        
    }
    
    @Test
    def void testQuitarUnaPizzaAlMenu(){
    	menu.agregarPizza(pizza1)
    	menu.agregarPizza(pizza2)
    	
    	menu.quitarPizza(pizza1)
    	
    	Assert.assertEquals(menu.cantidadDePizzas(), 1)
    	Assert.assertFalse(menu.tienePizza(pizza1))
    }
    
    @Test
    def void testEditarUnaPizza(){
    	menu.agregarPizza(pizza2)
    	
    	menu.quitarIngredientePizza(pizza2, panceta)
    	menu.agregarIngredientePizza(pizza2, aceitunas)
    	menu.cambiarNombrePizza(pizza2, "PizzaAceituna")
    	menu.cambiarPrecioPizza(pizza2, 150.0)
    	
    	Assert.assertEquals(pizza2.nombre, "PizzaAceituna")
    	Assert.assertTrue(pizza2.ingredientes.contains(aceitunas))
    	Assert.assertFalse(pizza2.ingredientes.contains(panceta))
    	Assert.assertEquals(pizza2.ingredientes.size(), 1)
    	Assert.assertTrue(pizza2.precio == 150.0)
    }
    
    @Test
    def void testAgregarIngredienteExtraAlMenu() {
    	menu.agregarIngredienteExtra(panceta)
    	
    	Assert.assertEquals(menu.cantidadDeIngredientesExtras(), 1)
    	Assert.assertTrue(menu.tieneIngredienteExtra(panceta))
    }
    
    @Test
    def void testQuitarIngredienteExtraAlMenu() {
    	menu.agregarIngredienteExtra(panceta)
    	menu.agregarIngredienteExtra(aceitunas)
    	
    	menu.quitarIngredienteExtra(panceta)
    	
    	Assert.assertEquals(menu.cantidadDeIngredientesExtras(), 1)
    	Assert.assertFalse(menu.tieneIngredienteExtra(panceta))
    }
    
    @Test
    def void testEditarIngrediente(){
    	menu.agregarIngredienteExtra(panceta)
    	
    	menu.cambiarNombreIngrediente(panceta, "Bacon")
    	menu.cambiarPrecioIngrediente(panceta, 10.0)
    	
    	Assert.assertEquals(panceta.nombre, "Bacon")
    	Assert.assertEquals(menu.ingreExtras.size(), 1)
    	Assert.assertTrue(panceta.precio == 10.0)
    }
}