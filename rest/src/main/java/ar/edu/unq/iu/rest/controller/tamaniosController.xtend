package ar.edu.unq.iu.rest.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import ar.edu.unq.iu.appmodel.MenuAppModel
import ar.edu.unq.iu.modelo.TamanioChica
import ar.edu.unq.iu.modelo.TamanioFamiliar
import ar.edu.unq.iu.modelo.TamanioPorcion
import ar.edu.unq.iu.modelo.TamanioGrande

@Controller
class TamaniosController {
	extension JSONUtils = new JSONUtils

	MenuAppModel appModel = new MenuAppModel()
	
	@Get("/tamanios")
	def leer() {
		response.contentType = ContentType.APPLICATION_JSON
		val tamanios = #[new TamanioPorcion, new TamanioChica, new TamanioGrande, new TamanioFamiliar]
		ok(tamanios.toJson)
	}
}