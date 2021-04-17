class Game 
  attr_reader :player 

  def initialize(player, size = 4) 
    @board = Board.new(size) 
    @previous_guess = nil 
    @player = player 
  end 