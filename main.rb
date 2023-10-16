require './Player'
require './Turn'
require './Game'


player1 = Player.new
player2 = Player.new

game1 = Game.new(player1, player2)
game1.start_game