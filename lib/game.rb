class Game
  def initialize
  end

  def tick
    Board.all_cells.each do |cell|
      cell.cell_analysis
    end
  end
end
