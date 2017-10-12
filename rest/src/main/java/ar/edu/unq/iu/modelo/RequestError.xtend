package ar.edu.unq.iu.modelo

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RequestError {
	String error
	
	new (String e){
		this.error = e
	}
}

class BadRequestError extends RequestError {
	new(){
		super("Datos inconcistentes")
	}
}