package ar.edu.unq.iu.rest.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import ar.edu.unq.iu.appmodel.MenuAppModel

@Controller
class PizzasController {
	extension JSONUtils = new JSONUtils

	MenuAppModel appModel = new MenuAppModel()
	
	@Get("/pizzas")
	def leer() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(appModel.repoPizza.objects.toJson)
	}
}