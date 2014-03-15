class Cell
  attr_reader :x, :y, :state

  def initialize(x,y)
    @x = x
    @y = y
    @state = false
  end

  def switch(state)
    @state = state
  end

  def neighbor_check
    @neighbors = []
    Board.all_cells.each do |cell|
      if self != cell && cell.state == true
        # if (self.x == cell.x || self.x-1 == cell.x || self.x+1 == cell.x) &&
        #   (self.y == cell.y || self.y-1 == cell.y || self.y+1 == cell.y)
          if (self.x - cell.x).abs < 2 && (self.y - cell.y).abs < 2
          @neighbors << cell
        end
      end
    end
    @neighbors.length
  end

  def cell_analysis
    if self.state == true
      if self.neighbor_check < 2 || self.neighbor_check > 3
          self.switch(false)
      end
    else
      self.state == false && self.neighbor_check == 3
        self.switch(true)
    end
  end
end
