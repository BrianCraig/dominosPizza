package ar.edu.unq.iu.rest.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import ar.edu.unq.iu.appmodel.UsuariosAppModel
import org.uqbar.xtrest.api.annotation.Put

@Controller
class UsuariosController {
	extension JSONUtils = new JSONUtils
	
	UsuariosAppModel appModel = new UsuariosAppModel()
	
	@Post("/ingreso")
	def ingresar() {
		ok(null)
	}
	
	@Put("/usuarios/:id")
	def editar() {
		ok(null)
	}
	
	@Post("/usuarios") 
	def crear() {
		ok(null)
	}
	
	@Get("/usuarios/:id/pedidos") 
	def leerPedido() {
		ok(null)
	}
}