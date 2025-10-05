import wollok.game.*
import pepita.*
import randomizer.*

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

const manzana = new Manzanas(position = randomizer.position())

class Alpiste {
	var property position
	var property peso = 40.randomUpTo(100)

	method energiaQueOtorga() {
		return peso
	}

	method image() {return "alpiste.png"}

	method encontroCon(cosa) {
		cosa.comer(self)
		game.say(pepita, "yummy, recupere " + self.energiaQueOtorga() + "de energía")
	}


}

const alpiste = new Alpiste (position = randomizer.position())

object comidaRandom {
	method alpisteOManzana() {
		return if (0.randomUpTo(1)>= 0.5){
			 alpiste
		} else {
			manzana
		}
	}
}



