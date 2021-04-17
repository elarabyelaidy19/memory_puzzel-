class Game 
  attr_reader :player 

  def initialize(player, size = 4) 
    @board = Board.new(size) 
    @previous_guess = nil 
    @player = player 
  end 

  def compare_guess(new_guess) 
    if previous_guess 
      if match?(previous_guess, new_guess) 
        player.receive_match(previous_guess)
      else 
        puts "try again!" 
        [previous_guess, new_guess].each {|pos| board.hide(pos) } 
      end 
      self.previous_guess = nil 
      player.previous_guess = nil 
    else 
      self.previous_guess = new_guess 
      player.previous_guess = new_guess 
    end 
  end 

  def match?(pos1, pos2) 
    board[pos1] == board[pos2] 
  end 

  def make_guess(pos) 
    revealed_value = board.reveal(pos) 
    pl