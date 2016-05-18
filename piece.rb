require 'singleton'

class Piece
  attr_reader :pos, :board

  attr_accessor :color

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def in_bounds?(pos)
    row, col = pos

    row_max = @board.grid.length
    col_max = @board.grid[0].length

    row < row_max && col < col_max && row >= 0 && col >= 0
  end

  def to_s
    "o"
  end

  def enemy_color?(color)
    @color != color
  end

  def enemy_at?(pos)
    board[pos].enemy_color?(color)
  end

  def valid_moves
    moves.select { |move| is_valid?(move) }
  end

  def is_valid?(move)
    copy = @board.dup

    !causes_check_in(move, copy) && in_bounds?(move)
  end

  def causes_check_in?(move, copy)
    copy.move!(@pos, move)

    player = nil

    if color == :white
      player = copy.white_player
    else
      player = copy.black_player
    end

    player.check_in?
  end

  def exists?
    true
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

  def exists?
    false
  end
end
