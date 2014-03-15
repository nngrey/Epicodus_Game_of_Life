class Board
  attr_reader :all_cells

  @@all_cells = []

  def initialize
  end

  def Board.create(number)
    for x in 1..number
      for y in 1..number
        @@all_cells << Cell.new(x,y)
      end
    end
  end

  def Board.all_cells
    @@all_cells
  end

  def Board.clear
    @@all_cells = []
  end
end
