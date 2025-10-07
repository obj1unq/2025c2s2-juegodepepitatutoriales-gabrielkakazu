import wollok.game.*
import pepita.*
import randomizer.*

class Manzana {
	const base= 5
	var madurez = 1
	var property position = randomizer.position()

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

	method esManzana() = true
	method esAlpiste() = false

}

class Alpiste {
	var property position = randomizer.position()
	var property peso = 40.randomUpTo(100).roundUp()

	method energiaQueOtorga() {
		return peso
	}

	method image() {return "alpiste.png"}

	method encontroCon(cosa) {
		cosa.comer(self)
		game.say(pepita, "yummy, recupere " + self.energiaQueOtorga() + "de energía")
	}

	method esAlpiste() = true

	method esManzana() = false
}

const alpiste = new Alpiste (position = randomizer.position())

object comidaRandom {
	method crear() {
		const comida = if (0.randomUpTo(2) < 1) 
			{ new Manzana() } 
		else 
			{ new Alpiste() }
		
		game.addVisual(comida)
	}
}



