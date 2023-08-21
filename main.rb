# main.rb

require_relative 'player'
require_relative 'game'

player1 = Player.new
player2 = Player.new

game = Game.new(player1, player2)

puts "Get ready to start the Math Game!"

until game.game_over?
  game.next_turn
end

game.display_winner
