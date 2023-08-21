# game.rb

class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
  end

  def current_player
    @players[@current_player_index]
  end

  def next_turn
    num1 = rand(1..20)
    num2 = rand(1..20)
    answer = num1 + num2

    puts "Player #{@current_player_index + 1}, what is #{num1} + #{num2}?"
    user_answer = gets.chomp.to_i

    if user_answer == answer
      puts "Correct!\n\n"
    else
      current_player.lose_life
      other_player = (@current_player_index + 1) % 2
      puts "Seriously! No! Player #{@current_player_index + 1} loses a life."
      puts "Remaining lives: Player 1: #{@players[0].lives}/3 Player 2: #{@players[1].lives}/3\n\n"
    end

    @current_player_index = (@current_player_index + 1) % @players.length
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def display_winner
    winner = @players.find { |player| player.lives > 0 }
    winner_index = @players.index(winner) + 1
    puts "Game over! Player #{winner_index} wins with #{winner.lives}/3 lives remaining."
  end
end
