class Game
  def initialize(player1, player2)
    @turn = Turn.new(player1, player2)
  end

  def start_game
    while !@turn.game_over do
      @turn.new_turn
      display_score
    end
    announce_winner
    end_game
  end

  def display_score
    puts "P#{@turn.players[0]}: #{@turn.players[0].player_score} vs P#{@turn.players[1]}: #{@turn.players[1].player_score}"
  end

  def announce_winner
    # each turn is ended with the players' turn switched
    # so the once one of the player's score reaches 0, the other player is the winner
    puts "Player #{@turn.current_player} wins with a score of #{@turn.current_player.player_score}"
  end

  def end_game
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end

end