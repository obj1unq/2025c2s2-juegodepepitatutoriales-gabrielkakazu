import wollok.game.*
import pepita.*
import extras.*
import comidas.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0 ..  game.height() - 1).anyOne()
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}

	method comidaAleatoria() {
		if (game.allVisuals().size() < 9){
			game.onTick(3*1000, 
				"comida Random", 
				game.addVisual(comidaRandom.alpisteOManzana())
			)
	}
	
}

}

