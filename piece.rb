require 'singleton'

class Piece
  attr_reader :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def in_bounds?(pos)
    row, col = pos

    row < 8 && col < 8 && row >= 0 && col >= 0
  end
  
  def to_s
    "o"
  end
end

class NullPiece
  include Singleton

  def to_s
    " "
  end
end
