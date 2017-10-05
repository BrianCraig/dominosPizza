package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test
import org.junit.Before

class PlatoTest {
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

        muzza = new Pizza("Muzzarella", 70.0) => [
            ingredientes.add(queso)
        ]

        jym = new Pizza("Jamon y Morrones", 80.0) => [
            ingredientes.add(jamon)
            ingredientes.add(morron)
        ]

    }

    @Test
    def void UnaFamiliarDeMuzzaConMorronesTieneElPrecioCorrectoTest(){
        val plato = new Plato(muzza, new TamanioFamiliar) => [
            agregarAgregado(new Agregado(morron, new LadoAmbos))
        ]
        Assert.assertEquals(plato.precio, (70.0 * 1.25) + 20.0, 0.0)
    }

    @Test
    def void UnaPorcionDeJamonYMorronesConAceitunasTieneElPrecioCorrectoTest(){
        val plato = new Plato(jym, new TamanioPorcion) => [
            agregarAgregado(new Agregado(aceitunas, new LadoIzquierdo))
        ]
        Assert.assertEquals(plato.precio, (80.0 * 0.25) + 8.0, 0.0)
    }

}
