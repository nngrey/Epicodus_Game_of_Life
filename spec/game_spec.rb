require 'rspec'
require 'cell'
require 'game'
require 'board'

# describe Game do

# end

describe Cell do
  describe 'initialize' do
    it 'initializes a new cell with coordinates' do
      test_cell = Cell.new(1,2)
      test_cell.should be_an_instance_of Cell
    end
  end

  describe 'switch' do
    it 'switches the state of a cell' do
      test_cell = Cell.new(1,2)
      test_cell.switch(true)
      test_cell.state.should eq true
    end
  end
end

describe Board do
  before do
    Board.clear
  end
  describe 'initialize' do
    it 'initializes a new board' do
      test_board = Board.new
      test_board.should be_an_instance_of Board
    end
  end

  describe 'create' do
    it 'creates a new board with a number of cells' do
      test_board = Board.new
      test_board = Board.create(5)
      Board.all_cells.length.should eq 25
    end
  end

  describe 'neighbor_check' do
    it 'checks the true neighbors around a cell' do
      test_board = Board.new
      test_board = Board.create(5)
      Board.all_cells[10].switch(true)
      Board.all_cells[11].switch(true)
      Board.all_cells[12].switch(true)
      Board.all_cells[11].neighbor_check.should eq 2
    end
  end

  describe 'cell_analysis' do
    it 'determines whether the cell should switch' do
      test_board = Board.new
      test_board = Board.create(5)
      Board.all_cells[10].switch(true)
      Board.all_cells[11].switch(true)
      Board.all_cells[11].cell_analysis
      Board.all_cells[11].state.should eq false
    end
  end
end
