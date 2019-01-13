require_relative 'board'
require_relative 'player'
require_relative 'game_state'
require 'pry'
class TicTacToe
  include GameState


  attr_reader :board, :current_player, :grid

  def initialize(board, player_x, player_o)
    @board = board
    @grid = board.grid
    @x = player_x
    @o = player_o
    @current_player = @x
  end

  def run
    puts 'TicTacToe'
    puts ''
    while true 
      @board.print
      input = gets.chomp
      move(input)
      break if game_over? 
      switch_player
    end
  end

  def move(slot)
    while !@board.valid?(slot)
      puts 'Please enter a valid slot.'
      slot = gets.chomp
    end
    @grid[slot.to_i] = @current_player.piece
  end

  def switch_player
    if @current_player == @x
      @current_player = @o
    else
      @current_player = @x
    end
  end
end