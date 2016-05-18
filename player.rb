require_relative 'piece_manifest'
class Player

  attr_accessor :king, :color

  def initialize(color, display)
    @color = color
    @display = display
  end

  def in_check?
    king.in_check?
  end

  def checkmate?
    king.checkmate?
  end

  def get_input
    result = nil

    until result
      @display.render
      result = @display.get_input
    end

    result
  end

  def move
    get_input
  end

end
