require_relative 'board'
require_relative 'display'
require_relative 'player'
require 'byebug'

class Game

  attr_reader :board, :display

  def initialize
    @board = Board.new(false)
    @display = Display.new(@board)

    @board.white_player = Player.new(:white, @display)
    @board.black_player = Player.new(:black, @display)
    @board.current_player = @board.white_player
    @board.fill_grid
  end

  def run
    until @board.over?
      move = play_turn # => white king goes to danger
      move2 = play_turn # => white king goes to danger

      @board.move(move, move2)

      @board.switch_player # => switch the player
    end
  end

  def get_input
    @board.current_player.move
  end

  def play_turn
    get_input
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new

  game.run
end
