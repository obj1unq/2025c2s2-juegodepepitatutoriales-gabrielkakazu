import wollok.game.*
object pepita {
	var energia = 500

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method volar(kms) {energia = energia - 9 - kms }
	
	method energia() {return energia}

	var position = game.origin()

	method position() {return position}
/*		if ((_posicion.x()>0 and _posicion.x()>10) and (
			(_posicion.y()>0 and _posicion.y()>10))
		){
	method position(_posicion) {
			position = 
				game.at(_posicion.x().max(0), 
						_posicion.y().max(0))
	}*/

	method position(_posicion) {
		const nuevaX = _posicion.x().max(0).min(12)
		const nuevaY = _posicion.y().max(0).min(12)
		position = game.at(nuevaX, nuevaY)
	}

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
		self.validarMover()
		self.volar(self.position().distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method cansada(){ return energia <= 0}

	method validarMover(){
		if (self.cansada() or self.conSilvestre())
			{self.error("no me puedo mover :(")}
	}

	method conSilvestre() {	return self.position() == silvestre.position()}

}

object fisica {
	method configTeclas(){
		keyboard.left().onPressDo({
			pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({
			pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({
			pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({
			pepita.irA(pepita.position().down(1))})
	}

}

object silvestre {
	method position() {
		return game.at(pepita.position().x().max(3),0)
	}
	method image() {return "silvestre.png"}
}

object nido {
	var property position = game.at(8, 7)
	method image() {return "nido.png"}
}
