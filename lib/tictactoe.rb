require_relative 'board'
require_relative 'player'

class TicTacToe
  WinConditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_reader :board, :current_player

  def initialize
    board = Board.new
    @board = board.grid
    @x = Player.new('x')
    @o = Player.new('o')
    @current_player = @x
  end

  def run
    puts 'TicTacToe'
    puts ''
    while true 
      print_board
      input = gets.chomp
      move(input)
      if win?(@x)
        print_board
        puts 'X had won!'
        break
      end
      if win?(@o)
        print_board
        puts 'O has won!'
        break
      end
      if draw?
        puts 'Neither player wins, its a draw!'
        break
      end
      switch_player
    end
  end

  def move(slot)
    raise 'Not a valid number' unless slot =~ /^-?[0-9]+$/
    new_slot = slot.to_i
    raise 'Invalid slot' if new_slot > @board.size - 1
    raise 'Slot is in use' if @board[new_slot] != nil
    @board[new_slot] = @current_player.piece
  end

  def switch_player
    if @current_player == @x
      @current_player = @o
    else
      @current_player = @x
    end
  end

  def print_board
    board.each_slice(3).to_a.each do |i|
     puts i.to_s.tr(',', '|').tr('[', '|').tr(']', '|').tr(' ', '|')
    end
  end

  def win?(player)
    WinConditions.any? do |array|
      array.all? do |slot|
        @board[slot] == player.piece
      end
    end
  end

  def draw?
    !@board.include? nil
  end
end

tictactoe = TicTacToe.new
tictactoe.run