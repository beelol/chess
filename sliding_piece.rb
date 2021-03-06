require_relative 'piece'

class SlidingPiece < Piece
  def moves
    vertical_moves + horizontal_moves
  end

  def vertical_moves
    positions = []

    i = pos[0]
    while i < 8
      i += 1

      positions << [i, pos[1]]
    end

    i = pos[0]
    while i > 0
      i -= 1

      positions << [i, pos[1]]
    end

    positions
  end

  def horizontal_moves
    positions = []

    i = pos[1]
    while i < 8
      i += 1

      positions << [pos[0], i]
    end

    i = pos[1]
    while i > 0
      i -= 1

      positions << [pos[0], i]
    end

    positions
  end

  def diagonal_moves
    positions = []

    row, col = pos

    while row < 8 && col < 8
      row += 1
      col += 1

      positions << [row, col]
    end

    row, col = pos

    while row > 0 && col > 0
      row -= 1
      col -= 1

      positions << [row, col]
    end

    row, col = pos

    while row > 0 && col < 8
      row -= 1
      col += 1

      positions << [row, col]
    end

    row, col = pos

    while row < 8 && col > 0
      row += 1
      col -= 1

      positions << [row, col]
    end

    positions
  end
end
