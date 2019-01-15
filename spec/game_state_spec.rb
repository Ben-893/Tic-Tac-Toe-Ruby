require 'game_state.rb'
require 'board.rb'
require 'player.rb'
require 'tictactoe.rb'

describe GameState do
  let(:board) { Board.new }
  let(:player_x) { Player.new('x') }
  let(:player_o) { Player.new('o') }
  let(:tictactoe) { TicTacToe.new(board, player_x, player_o) }

  describe '#win?' do
    it 'should check the board to see if a player has won' do
      tictactoe.move('0')
      tictactoe.move('1')
      tictactoe.move('2')
      expect(tictactoe.win?).to eq(true)
    end
  end

  describe '#draw?' do
    it 'should return true if there are not any slots free' do
      tictactoe.move('0')
      tictactoe.move('1')
      tictactoe.move('2')
      tictactoe.move('3')
      tictactoe.move('4')
      tictactoe.move('5')
      tictactoe.move('6')
      tictactoe.move('7')
      tictactoe.move('8')
      expect(tictactoe.draw?).to eq(true)
    end
    it 'should return false if there are any slots free' do
      expect(tictactoe.draw?).to eq(false)
    end
  end

  describe '#game_won?' do
    it 'should return true if the game is won' do
      allow(tictactoe).to receive(:win?).and_return(true)
      expect(tictactoe.game_won?).to eq true
    end
    it 'should return nil if the game is not won' do
      allow(tictactoe).to receive(:win?).and_return(nil)
      expect(tictactoe.game_won?).to eq nil
    end
  end

  describe '#game_draw' do 
    it 'should return true if the game is drawn' do
      allow(tictactoe).to receive(:draw?).and_return(true)
      expect(tictactoe.game_draw?).to eq true
   end
    it 'should return nil if the game is not drawn' do
      allow(tictactoe).to receive(:draw?).and_return(nil)
      expect(tictactoe.game_draw?).to eq nil
    end
  end

  describe '#game_over?' do
    it 'should return true if the game is won' do
      allow(tictactoe).to receive(:game_won?).and_return(true)
      expect(tictactoe.game_over?).to eq true
    end
    it 'should return true if the game is drawn' do
      allow(tictactoe).to receive(:game_draw?).and_return(true)
      expect(tictactoe.game_over?).to eq true
    end
    it 'should return false if the game is not over' do
      allow(tictactoe).to receive(:game_won?).and_return(false)
      allow(tictactoe).to receive(:game_draw?).and_return(false)
      expect(tictactoe.game_over?).to eq false
    end
    it 'should return false if the game is not drawn' do
      allow(tictactoe).to receive(:game_draw?).and_return(false)
      expect(tictactoe.game_over?).to eq false
    end
  end
end