require 'singleton'

class Piece
  attr_reader :pos

  attr_accessor :color

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def in_bounds?(pos)
    row, col = pos

    row < 8 && col < 8 && row >= 0 && col >= 0
  end

  def to_s
    "o"
  end

  def enemy_color?(color)
    @color != color
  end

  def enemy_at(pos)
    board[pos].enemy_color?(color)
  end
end

class NullPiece
  include Singleton

  def to_s
    " "
  end

  def color
    nil
  end

  def enemy_color?(color)
    false
  end
end
