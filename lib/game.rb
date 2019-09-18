class Game

  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position(combo[0]) == position(combo[1]) &&
      position(combo[1]) == position(combo[2]) &&
      position_taken?(combo[0])
  end
  end

  def draw?
    !won? && @board.all?{|token| token == "X" || token == "O"}
  end

  def over?
    won? || draw?
  end

  def winner
  if winning_combo = won?
    @winner = position(winning_combo.first)
  end
end
end
