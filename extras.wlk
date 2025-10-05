import wollok.game.*
import comidas.*
import pepita.*
import randomizer.*

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
        if (not self.hayMuroEn(pepita.position().down(1))){
		    game.onTick(800, "caer", 
			    {pepita.caer()}
		    )
        }
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
		game.removeTickEvent("caer")
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


