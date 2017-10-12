package ar.edu.unq.iu.rest.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import ar.edu.unq.iu.appmodel.UsuariosAppModel
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Body
import ar.edu.unq.iu.modelo.BadRequestError
import ar.edu.unq.iu.modelo.Login
import ar.edu.unq.iu.modelo.RequestError

@Controller
class UsuariosController {
	extension JSONUtils = new JSONUtils
	
	UsuariosAppModel appModel = new UsuariosAppModel()
	
	@Post("/ingreso")
	def ingresar(@Body String bodyConLogin) {
		try {
			val login = bodyConLogin.fromJson(Login)
			if(appModel.existeClienteCon(login.nick, login.password)){
				ok(appModel.clienteCon(login.nick, login.password).toJson)
			} else {
				badRequest(new RequestError("el nick y la clave no coinciden").toJson)
			}
		} catch (Exception e){
			badRequest(new BadRequestError().toJson)
		}
	}
	
	@Put("/usuarios/:id")
	def editar() {
		ok(null)
	}
	
	@Post("/usuarios") 
	def crear(@Body String bodyConUsuario) {
		ok(null)
	}
	
	@Get("/usuarios/:id/pedidos") 
	def leerPedido() {
		ok(null)
	}
}