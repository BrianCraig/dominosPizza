package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors
import org.simplejavamail.email.Email
import org.simplejavamail.email.EmailBuilder

@Accessors
class ConstructorEmail {
	Email email;
	final String DEMORAS = "El pedido llegara con demoras, sepa disculpar las molestias."
	final String A_TIEMPO = "Su pedido esta en viaje."
	
	def pedidoConDemora(String to) {
		email = new EmailBuilder()
		.from("Pizza Hutt", "danncorbalan@gmail.com")
		.to("cliente", to)
		.subject(DEMORAS)
		.text(DEMORAS)
		.build
		
		return email
	}
	
	def pedidoATiempo(String to){
		email = new EmailBuilder()
		.from("Pizza Hutt", "danncorbalan@gmail.com")
		.to("cliente", to)
		.subject(A_TIEMPO)
		.text(A_TIEMPO)
		.build
		
		return email
	}
	
}