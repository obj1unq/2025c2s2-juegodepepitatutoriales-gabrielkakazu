import wollok.game.*
import comidas.*
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

	method gravedad(){
		game.onTick(800, "caer", {pepita.caer()})
	}

	method materia() {
		game.whenCollideDo(pepita, {cosa => cosa.encontroCon(pepita)}
		)
	}

	method hayMuroEn(lugar) {
		return (lugar == muro.position()) or (lugar == muro2.position())
	}
	

}

object silvestre {
	method position() {
		return game.at(pepita.position().x().max(3),0)
	}
	method image() {return "silvestre.png"}

	method encontroCon(cosa) {
		game.say(self, "jaja, te atrapé")
		cosa.lose()
		game.onTick(2000, "LOSE" , {game.stop()})
	}
}

object nido {
	var property position = game.at(8, 9)
	method image() {return "nido.png"}

		method encontroCon(cosa) {
		cosa.win()
		game.onTick(2000, "WIN" , {game.stop()})
	}
}

object muro{
	var property position = game.at(2, 0)
	method image() {return "muro.png"}
	
	method encontroCon(cosa) {
		game.say(self, "jaja, te atrapé")
		game.removeTickEvent("caer")
	}
}

object muro2{
	var property position = game.at(2, 1)
	method image() {return "muro.png"}

	method encontroCon(cosa) {
		game.say(self, "jaja, te atrapé")
		game.removeTickEvent("caer")
	}
}
