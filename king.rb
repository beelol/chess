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
    "K"
  end

  def in_check?
    enemy_moves.include?(pos)
  end

  def checkmate?
    in_check? && moves.empty?
  end

  def enemy_moves
    enemy_moves = []

    if color == :white
      board.grid.each do |row|
        row.each do |piece|
          enemy_moves << piece.moves if piece.color == :black
        end
      end
    else
      board.grid.each do |row|
        row.each do |piece|
          enemy_moves << piece.moves if piece.color == :white
        end
      end
    end

    enemy_moves
  end
end
