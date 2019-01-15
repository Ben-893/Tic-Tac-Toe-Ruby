require 'board.rb'
require 'player.rb'
require 'tictactoe.rb'

describe Board do
  let(:board) { Board.new }
  let(:player_x) { Player.new('x') }
  let(:player_o) { Player.new('o') }
  let(:tictactoe) { TicTacToe.new(board, player_x, player_o) }

  it 'should start with an empty grid' do
    expect(board.grid).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
  end

  describe '#valid_character?' do
    it 'should return false if the player tries to enter a character that is not a number' do
      expect(board.valid_character?('$')).to eq nil
    end
    it 'should return true if the player tries to enter a character that is a number' do
      expect(board.valid_character?('0')).to eq 0
    end
  end

  describe '#slot_available?' do
    it 'should return false if a player tries to use a slot thats already in use' do
      tictactoe.move('0')
      expect(board.slot_available?('0')).to eq false
    end
    it 'should return true if a player tries to use a slot thats not in use' do
      expect(board.slot_available?('0')).to eq true
    end
    it 'should return false if a player tries to select a slot greater than 9' do
      expect(board.slot_available?('9')).to eq false
    end
    it 'should return true if a player tries to select a slot lower than 9' do
      expect(board.slot_available?('8')).to eq true
    end
  end

  describe '#valid?' do
    it 'should return true if the character is valid' do
      expect(board.valid?('0')).to eq true
    end
    it 'should return nil if the character is not valid' do
      expect(board.valid?(0)).to eq nil
    end
    it 'should return false if the slot if already taken' do
      allow(board).to receive(:slot_available?).and_return(false)
      expect(board.valid?('0')).to eq false
    end
  end

  describe '#print' do
    it 'should display the board' do
      tictactoe.move('0')
      board.print
      expect(board.print).to eq([['x', nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end
  end
end