require_relative 'sliding_piece'

class Queen < SlidingPiece
  def move_dirs
    [:horizontal, :vertical, :diagonal]
  end

  def to_s
    "Q"
  end
end
