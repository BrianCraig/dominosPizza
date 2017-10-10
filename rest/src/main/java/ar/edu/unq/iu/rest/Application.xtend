package ar.edu.unq.iu.rest

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.iu.rest.controller.IngredientesController

class Application {
	def static void main(String[] args) {
		XTRest.start(
			9000, 
			IngredientesController
		)
	}
}