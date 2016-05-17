class Game
  def initialize
    @board = Board.new
  end
  def run
    until @board.over?

      @board.mark(pos)
    end
  end
end



if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
