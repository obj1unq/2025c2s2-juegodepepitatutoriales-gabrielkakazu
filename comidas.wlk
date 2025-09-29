import wollok.game.*
import pepita.*

class Manzanas {
	const base= 5
	var madurez = 1
	var property position

	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	method image() {return "manzana.png"}

	

	method encontroCon(cosa) {
		cosa.comer(self)
		game.say(pepita, "yummy, recupere " + self.energiaQueOtorga() + "de energía")
	}

}

const manzana = new Manzanas(position = game.at(2,8))

class Alpiste {
	var property position
	var property peso

	method energiaQueOtorga() {
		return peso
	}

	method image() {return "alpiste.png"}

	method encontroCon(cosa) {
		cosa.comer(self)
		game.say(pepita, "yummy, recupere " + self.energiaQueOtorga() + "de energía")
	}


}

const alpiste = new Alpiste (position = game.at(4,3), peso = 20)



