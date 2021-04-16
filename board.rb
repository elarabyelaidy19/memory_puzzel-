
class Board 
  attr_reader :size 

  def initialize(size = 4) 
    @grid = Array.new(size) { Array.new(size) } 
    @size = size 
  end 

  def [](pos) 
    row, col = pos 
    grid[row][col] 
  end 

  def []=(pos, value) 
    row, col = pos 
    grid[row][col] = value 
  end 

  def hide(pos) 
    self[pos].hide 
  end 

  def reveal(pos) 
    if revealed?(pos) 
      puts "can not flip a card that has revealed"
    else 
      self[pos].reveal
    end 
    self[pos].value 
  end 

  def revealed?(pos) 
    self[pos].revealed? 
  end 

  def won?
    grid.all? do |row| 
      row.all?(&:revealed?) 
    end 
  end 

  private 

  attr_reader :grid 
end 

  def 