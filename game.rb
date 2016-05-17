class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)

    @board.white_player = Player.new(:white, @display)
    @board.black_player = Player.new(:black, @display)


  end

  def run
    until @board.over?
      play_turn # => white king goes to danger

      @board.switch_player # => switch the player
    end
  end

  def play_turn
    @board.current_player.move
  end

end



if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
