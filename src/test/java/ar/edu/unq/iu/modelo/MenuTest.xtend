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
		pizza1 = new Pizza(null, 0.0, null)
		pizza2 = new Pizza(null, 0.0, null)
		panceta = new Ingrediente("Panceta", 5.0)
		aceitunas = new Ingrediente("Aceitunas", 3.5)
	}
	
	@Test
    def void testAgregaUnaPromoAlMenu(){    	
    	menu.agregarPizza(pizza1)
        
        Assert.assertEquals(menu.cantidadDePizzas(), 1)
        Assert.assertTrue(menu.tienePizza(pizza1))
        
    }
    
    @Test
    def void testQuitarUnaPromoAlMenu(){
    	menu.agregarPizza(pizza1)
    	menu.agregarPizza(pizza2)
    	
    	menu.quitarPizza(pizza1)
    	
    	Assert.assertEquals(menu.cantidadDePizzas(), 1)
    	Assert.assertFalse(menu.tienePizza(pizza1))
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
}