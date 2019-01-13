module GameState
  WinConditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def win?
    WinConditions.any? do |array|
      array.all? do |slot|
        @grid[slot] == @current_player.piece
      end
    end
  end

  def draw?
    !@grid.include? nil
  end

  def game_won?
    print_message("#{@current_player.piece} has won!") if win?
  end

  def game_draw?
    print_message('Neither player wins, its a draw!') if draw?
  end

  def game_over?
    game_won? || game_draw?
  end

  private

  def print_message(text)
    puts text
    @board.print
    true
  end
end