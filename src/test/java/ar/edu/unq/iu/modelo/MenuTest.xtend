package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test
import org.junit.Before

class MenuTest {
	
	Menu menu
	
	Promocion promo1
	
	Promocion promo2
	
	Ingrediente panceta
	
	Ingrediente aceitunas
	
	@Before
	def void setUp(){
		menu = new Menu()
		promo1 = new Promocion(null, 0.0)
		promo2 = new Promocion(null, 0.0)
		panceta = new Ingrediente("Panceta", 5.0)
		aceitunas = new Ingrediente("Aceitunas", 3.5)
	}
	
	@Test
    def void testAgregaUnaPromoAlMenu(){    	
    	menu.agregarPromo(promo1)
        
        Assert.assertEquals(menu.cantidadDePromos(), 1)
        Assert.assertTrue(menu.tienePromo(promo1))
        
    }
    
    @Test
    def void testQuitarUnaPromoAlMenu(){
    	menu.agregarPromo(promo1)
    	menu.agregarPromo(promo2)
    	
    	menu.quitarPromo(promo1)
    	
    	Assert.assertEquals(menu.cantidadDePromos(), 1)
    	Assert.assertFalse(menu.tienePromo(promo1))
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