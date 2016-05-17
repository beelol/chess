require_relative 'piece_manifest'


class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8){Array.new(8, NullPiece.instance)  }

    populate
  end

  def populate

    @grid.first.each_index do |i|
      @grid.first[i] = back_row(:black)[i]
    end

    @grid.last.each_index do |i|
      @grid.last[i] = back_row(:white)[i]
    end

    set_pawns_white
    set_pawns_black
  end

  def set_pawns_white
    @grid[-2].each_index do |i|
      @grid[-2][i] = Pawn.new([-2, i], self, :white)
    end
  end

  def set_pawns_black
    @grid[1].each_index do |i|
      @grid[1][i] = Pawn.new([1, i], self, :black)
    end
  end

  def back_row(color)
    x = color == :black ? 0 : 7
    [
      Rook.new([x, 0], self, color),
    Knight.new([x, 1], self, color),
    Bishop.new([x, 2], self, color),
    Queen.new([x, 3], self, color),
    King.new([x, 4], self, color),
    Bishop.new([x, 5], self, color),
    Knight.new([x, 6], self, color),
    Rook.new([x, 7], self, color)
  ]
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

  def in_check?(player)
  
  end

end
