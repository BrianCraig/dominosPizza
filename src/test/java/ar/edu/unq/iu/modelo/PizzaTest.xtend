package ar.edu.unq.iu.modelo

import org.junit.Assert
import org.junit.Test

class PizzaTest {

    @Test
    def void UnaPizzaEsUnaPizza(){
        Assert.assertEquals(Pizza, Pizza);
    }

}