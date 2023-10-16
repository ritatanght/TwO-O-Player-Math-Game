class Turn
  attr_reader :current_answer, :current_player, :game_over, :players

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = @players[rand(0..1)] # the player goes first is randomly selected
    @game_over = false
    @current_question = nil
    @current_answer = nil
  end

  def generate_question
    rand_num1 = rand(1..20)
    rand_num2 = rand(1..20)
    @current_question = "What does #{rand_num1} plus #{rand_num2} equal?"
    @current_answer = rand_num1 + rand_num2
  end

  def new_turn
    puts "----- NEW TURN -----"
    generate_question
    puts "Player #{@current_player}: #{@current_question}"
    print "> "
    player_answer = gets.chomp
    check_answer(player_answer)
    switch_turn
  end

  def switch_turn
    next_player_index = @current_player == @players[0]? 1: 0
    @current_player = @players[next_player_index]
  end

  def check_answer(player_answer)
    if player_answer.to_f == @current_answer
      puts "Player #{@current_player}: ✅YES! You are correct."
    else
      puts "Player #{@current_player}: ❌Seriously? No!"
      @current_player.lose_life
      # once a player's score reaches 0, the game is over
      if @current_player.score == 0
        @game_over = true
      end
    end
  end

end