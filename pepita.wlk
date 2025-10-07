import wollok.game.*
import comidas.*
import extras.*
import randomizer.*

object pepita {
	var energia = 10000

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method volar(kms) {energia = energia - 9 - kms }
	
	method energia() {return energia}

	var position = game.origin()

	method position() {return position}

	method position(_posicion) {
		const nuevaX = _posicion.x().max(0).min(12)
		const nuevaY = _posicion.y().max(0).min(12)
		position = game.at(nuevaX, nuevaY)
	}

/*	method encuentroConAlgo(_posicion) {
		if (fisica.hayMuroEn(_posicion)) {
			self.error("no puedo pasar")
		}
	}*/

	method image() {return 
		if (self.conSilvestre() or self.cansada()) 
			{ self.morir()} 
		else if (self.position() == nido.position())
			{self.enNido()}
		else {"pepita.png"}	
	}

	method morir() {return"pepita-gris.png"}

	method enNido() {return "pepita-grande.png"}

	method irA(nuevaPosicion) {
		self.validarMover(nuevaPosicion)
		self.volar(self.position().distance(nuevaPosicion))
		const nuevaX = nuevaPosicion.x().max(0).min(12)
		const nuevaY = nuevaPosicion.y().max(0).min(12)
		position = game.at(nuevaX, nuevaY)
	}

	method cansada(){ return energia <= 0}

	method validarMover(nuevaPosicion){
		if (self.cansada() or self.conSilvestre())
			{self.error("no me puedo mover :(")
			self.lose()}
		else if (fisica.hayMuroEn(nuevaPosicion)){
			self.error("hay un muro, che!")
		}
	}

	method conSilvestre() {	return self.position() == silvestre.position()}

	method caer() {
		position = game.at(position.x(), (position.y()-1).max(0))
	}

	method win() {
		game.say(self, "¡GANÉ!")
	}

	method lose() {
		game.say(self, "¡PERDÍ!")
	}

	method esComida(objeto) {
		return objeto.esManzana() or objeto.esAlpiste()
	}

	method esManzana() = false
	method esAlpiste() = false

}


