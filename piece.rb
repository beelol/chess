require 'singleton'
require_relative 'sliding_piece'

class Piece
  attr_reader :pos

  def initialize(pos)
    @pos = pos
  end

  def to_s
    "o"
  end
end

class NullPiece
  include Singleton

  def to_s
    " "
  end
end
