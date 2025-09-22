import wollok.game.*
object pepita {
	var energia = 100

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	var property position = game.origin()

	method image() {return if (self.position() == silvestre.position()) 
		{ self.morir()} else if (self.position() == nido.position())
		{self.enNido()}
		else {"pepita.png"}	
	}

	method morir() {return"pepita-gris.png"}

	method enNido() {return "pepita-grande.png"}


}

object nido {
	var property position = game.at(7, 7)
	method image() {return "nido.png"}
}

object silvestre {
	var property position = game.at(almuerzo,0)

	const almuerzo = pepita.position().y()

	method image() {
		return "silvestre.png"
	}

}


