require_relative 'stepping_piece'
class King < SteppingPiece
  MOVES = [
    [1, 1],
    [1, -1],
    [1, 0],
    [-1, 0],
    [-1, -1],
    [-1, 1],
    [0, 1],
    [0, -1]
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
    "K".colorize(@color)
  end
end
