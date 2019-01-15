require 'tictactoe.rb'

describe TicTacToe do

  let(:board) { Board.new }
  let(:player_x) { Player.new('x') }
  let(:player_o) { Player.new('o') }
  let(:tictactoe) { TicTacToe.new(board, player_x, player_o) }

  describe '#move' do
    it 'should allow player x to occupy slot 0' do
      tictactoe.move('0')
      expect(tictactoe.grid).to eq(['x', nil, nil, nil, nil, nil, nil, nil, nil])
    end
    it 'should start with player x as the current player' do
      expect(tictactoe.current_player.piece).to eq('x')
    end
    it 'should place a piece in a slot' do
      expect(tictactoe.move('0')).to eq 'x'
    end
  end

  describe '#run' do
    it 'should test the standard output' do
    allow(tictactoe).to receive(:gets).and_return("0")
      expect(STDOUT).to receive(:puts).with("TicTacToe")
      expect(STDOUT).to receive(:puts).with("X goes first")
      expect(STDOUT).to receive(:puts).with("|nil||nil||nil|").exactly(3).times
      allow(tictactoe).to receive(:game_over?).and_return(true)
      tictactoe.run
    end
  end

  describe '#switch_player' do
    it 'should change the next players turn' do
      tictactoe.switch_player
      expect(tictactoe.current_player.piece).to eq('o')
    end
    it 'should change the next players turn to x' do
      tictactoe.switch_player
      tictactoe.switch_player
      expect(tictactoe.current_player.piece).to eq('x')
    end
  end
end
