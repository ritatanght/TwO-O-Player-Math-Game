class Player
  START_LIVES = 3 # every player starts with 3 lives
  @@num_of_players = 0

  attr_reader :score

  def initialize()
    @@num_of_players += 1
    @name = @@num_of_players
    @score = START_LIVES
  end

  def to_s
    @name.to_s
  end

  def player_score
    "#{@score}/#{START_LIVES}"
  end

  def lose_life
    @score -= 1
  end

end
