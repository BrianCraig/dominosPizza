package ar.edu.unq.iu.rest

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.iu.rest.controller.IngredientesController
import ar.edu.unq.iu.bootstrap.DominosBootstrap
import ar.edu.unq.iu.rest.controller.TamaniosController
import ar.edu.unq.iu.rest.controller.PizzasController

class Application {
	def static void main(String[] args) {
		(new DominosBootstrap).run()
		
		XTRest.start(
			9000, 
			IngredientesController,
			TamaniosController,
			PizzasController
		)
	}
}