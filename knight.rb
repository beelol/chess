require_relative 'stepping_piece'
class Knight < SteppingPiece
  MOVES = [
    [1, 2],
    [2, 1],
    [-1, 2],
    [-1, -2],
    [-2, 1],
    [-2, -1],
    [2, -1],
    [1, -2]
  ]

  def moves
    result = []

    MOVES.each do |move|
      y, x = move
      row, col = @pos

      if in_bounds?([y + row, x + col])
        result << [y + row, x + col]
      end
    end

    result
  end

  def to_s
    "k"
  end
end
