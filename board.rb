require_relative 'piece_manifest'


class Board
  include Enumerable

  attr_reader :grid

  attr_accessor :white_player, :black_player, :current_player

  def initialize(fill = true)
    if fill
      @grid = Array.new(8){Array.new(8, NullPiece.instance)  }
      populate
    end
  end

  def each
    @grid.each do |row|
      row.each do |piece|
        yield piece
      end
    end
  end

  def populate
    @grid.first.each_index do |i|
      @grid.first[i] = back_row(:black)[i]
    end

    @grid.last.each_index do |i|
      @grid.last[i] = back_row(:white)[i]
    end

    set_pawns_white
    set_pawns_black
  end

  def switch_player
    if current_player == @white_player
      current_player = @black_player
    else
      current_player = @white_player
    end
  end

  def set_pawns_white
    @grid[-2].each_index do |i|
      @grid[-2][i] = Pawn.new([-2, i], self, :white)
    end
  end

  def set_pawns_black
    @grid[1].each_index do |i|
      @grid[1][i] = Pawn.new([1, i], self, :black)
    end
  end

  def back_row(color)
    x = color == :black ? 0 : 7

    king = King.new([x, 4], self, color)

    if color == :black
      @black_player.king = king
    else
      @white_player.king = king
    end

    [
      Rook.new([x, 0], self, color),
    Knight.new([x, 1], self, color),
    Bishop.new([x, 2], self, color),
    Queen.new([x, 3], self, color),
    king,
    Bishop.new([x, 5], self, color),
    Knight.new([x, 6], self, color),
    Rook.new([x, 7], self, color)
  ]
  end

  def move(start, end_pos)
    begin

      raise "Invalid position" unless valid_pos(start) && valid_end_pos?(end_pos)
      # or !piece.valid_move?(end_pos)
    rescue

      retry
    end

  end

  def move!(start, end_pos)
    piece = self[start]
    clear_pos(start)
    self[end_pos] = piece
  end

  def clear_pos(pos)
    self[pos] = NullPiece.instance
  end

  def valid_pos?(pos)
    in_bounds?(pos) && @grid[pos].exists
  end

  def valid_end_pos?(pos)
    in_bounds?(pos) && @grid[pos].color != @current_player.color
  end

  def in_bounds?(pos)
    row, col = pos

    row < @grid.length && col < @grid.length &&
    row >= 0 && col >= 0
  end

  def [](pos)
    row, col = pos

    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos

    @grid[row][col] = val
  end

  def in_check?
    @current_player.in_check?
  end

  def over?
    checkmate?
  end

  def checkmate?
    @current_player.checkmate?
  end

  def dup
    copy = Board.new(false)

    copy.grid.each_index do |i|
      row = copy[i]

      copy.each do |piece|
        row.each_index do |j|
          row[j] = piece
        end
      end
    end

    copy.white_player = @white_player
    copy.black_player = @black_player
    copy.current_player = @current_player

    copy
  end
end
