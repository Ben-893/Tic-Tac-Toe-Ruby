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
      break if game_over? 
      switch_player
    end
  end

  def valid_character?(slot)
    slot =~ /^-?[0-9]+$/
  end

  def slot_avalible?(slot)
    new_slot = slot.to_i
    @board[new_slot] == nil && new_slot <= @board.size - 1
  end

  def valid?(slot)
    valid_character?(slot) && slot_avalible?(slot)
  end

  def move(slot)
    while !valid?(slot)
      puts 'Please enter a valid slot.'
      slot = gets.chomp
    end
    @board[slot.to_i] = @current_player.piece
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

  def win?
    WinConditions.any? do |array|
      array.all? do |slot|
        @board[slot] == @current_player.piece
      end
    end
  end

  def draw?
    !@board.include? nil
  end

  def game_over?
    game_won? || game_draw?
  end

  def game_won?
    if win?
      print_board
      puts "#{@current_player.piece} has won!"
      true
    end
  end

  def game_draw?
    if draw?
      print_board
      puts 'Neither player wins, its a draw!'
      true
    end
  end
end


# TicTacToe.new.run