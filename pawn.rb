require_relative 'piece'

class Pawn < Piece
  MOVES = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1]
  ]

  def initialize(pos, board, up_facing)
    @pos = pos
    @board = board
    @up_facing = up_facing
  end

  def moves
    result << up_facing ? [1, 0] : [-1, 0]

    MOVES.each do |move|
      result << move if enemy_at?(move)
    end

    result.select { |move| in_bounds?(move) }
  end



end
