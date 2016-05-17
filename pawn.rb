require_relative 'piece'

class Pawn < Piece
  MOVES = [
    [1, 1],
    [1, -1],
    [-1, -1],
    [-1, 1]
  ]
  
  def moves
    result << color == :black ? [1, 0] : [-1, 0]

    MOVES.each do |move|
      result << move if enemy_at?(move)
    end

    result.select { |move| in_bounds?(move) }
  end

  def to_s
    "p".colorize(@color)
  end
end
