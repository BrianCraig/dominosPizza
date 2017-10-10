package ar.edu.unq.iu.rest.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import ar.edu.unq.iu.repo.RepoIngrediente

@Controller
class IngredientesController {
	extension JSONUtils = new JSONUtils
	
	@Get("/ingredientes")
	def leer() {
		response.contentType = ContentType.APPLICATION_JSON
    	val ingredientes = new RepoIngrediente() => [
    		create("Muzza", 10.0)
    		create("Jamon", 100.0)
    	]
		ok(ingredientes.objects.toJson)
	}
}