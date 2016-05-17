require_relative 'sliding_piece'
class Rook < SlidingPiece
  def move_dirs
    [:horizontal, :vertical]
  end

  def to_s
    "r".colorize(@color)
  end
end
