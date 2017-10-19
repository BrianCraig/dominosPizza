package ar.edu.unq.iu.rest

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.iu.rest.controller.IngredientesController
import ar.edu.unq.iu.bootstrap.DominosBootstrap
import ar.edu.unq.iu.rest.controller.TamaniosController
import ar.edu.unq.iu.rest.controller.PizzasController
import ar.edu.unq.iu.rest.controller.UsuariosController

class Application {
	def static void main(String[] args) {
		(new DominosBootstrap).run()
		
		XTRest.start(
			5500, 
			IngredientesController,
			TamaniosController,
			PizzasController,
			UsuariosController
		)
	}
}