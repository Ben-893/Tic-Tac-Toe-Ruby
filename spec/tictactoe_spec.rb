require 'tictactoe.rb'

describe TicTacToe do

  describe '#move' do
    it 'should allow player 1 to place a token in slot 1' do
      subject.move(0)
      expect(subject.board).to eq([true, nil, nil, nil, nil, nil, nil, nil, nil])
      end
    end
  end