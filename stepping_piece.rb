require_relative 'piece'

class SteppingPiece < Piece
  def moves
  end
end



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
    "K"
  end
end
