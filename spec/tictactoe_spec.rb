require 'tictactoe.rb'

describe TicTacToe do

  let(:board) { Board.new }
  let(:player_x) { Player.new('x') }
  let(:player_o) { Player.new('o') }
  let(:tictactoe) { TicTacToe.new(board, player_x, player_o) }

  describe '#move' do
    it 'should allow player x to occupy slot 0' do
      tictactoe.move('0')
      expect(tictactoe.board).to eq(['x', nil, nil, nil, nil, nil, nil, nil, nil])
    end
    it 'should start with player x as the current player' do
      expect(tictactoe.current_player.piece).to eq('x')
    end
    it 'should place a piece in a slot' do
      expect(tictactoe.move('0')).to eq 'x'
    end
  end
  
  describe '#slot_avalible?' do
    it 'should return false if a player tries to use a slot thats already in use' do
      tictactoe.move('0')
      expect(tictactoe.slot_avalible?('0')).to eq false
    end
    it 'should return false if a player tries to select a slot greater than 9' do
      expect(tictactoe.slot_avalible?('9')).to eq false
    end
  end

  describe '#valid?' do
    it 'should return true if the character is valid' do
      expect(tictactoe.valid?('0')).to eq true
    end
    it 'should return nil if the character is not valid' do
      expect(tictactoe.valid?(0)).to eq nil
    end
    it 'should return false if the slot if already taken' do
      allow(tictactoe).to receive(:slot_avalible?).and_return(false)
      expect(tictactoe.valid?('0')).to eq false
    end
  end

  describe '#valid_character?' do
    it 'should return false if the player tries to enter a character that is not a number' do
      expect(tictactoe.valid_character?('$')).to eq nil
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

  describe '#print_board' do
    it 'should display the board' do
      tictactoe.move('0')
      tictactoe.print_board
      expect(tictactoe.print_board).to eq([['x', nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end
  end
end
