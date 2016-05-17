require_relative 'piece'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8){Array.new(8, NullPiece.instance)  }

    populate
  end

  def populate
    rows = []

    rows << @grid.first
    rows << @grid[1]

    rows << @grid[-2]
    @grid.first.each_index do |i|
      @grid.first[i] = Piece.new([0, i], self)
    end
    @grid[1].each_index do |i|
      @grid[1][i] = Piece.new([1, i], self)
    end
    @grid.last.each_index do |i|
      @grid.last[i] =  Piece.new([-1, i], self)
    end

    @grid[-2].each_index do |i|
      @grid[-2][i] =  Piece.new([-2, i], self)
    end
  end

  def move(start, end_pos)
    begin

      raise "Invalid position" unless valid_pos(start)
      # or !piece.valid_move?(end_pos)
    rescue

      retry
    end

  end

  def valid_pos?(pos)
    in_bounds?(pos) && @grid[pos]
  end

  def in_bounds?(pos)
    row, col = pos

    row < @grid.length && col < @grid.length &&
    row >= 0 && col >= 0
  end

  def [](pos)
    row, col = pos

    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos

    @grid[row][col] = val
  end

end
