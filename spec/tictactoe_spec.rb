require 'tictactoe.rb'

describe TicTacToe do

  describe '#move' do
    it 'should allow player x to occupy slot 0' do
      subject.move('0')
      expect(subject.board).to eq(['x', nil, nil, nil, nil, nil, nil, nil, nil])
      end
    end
    it 'should raise an error if a player tries to use a slot thats already taken' do
      subject.move('0')
      expect{subject.move('0')}.to raise_error('Slot is in use')
    end
    it 'should raise an error if a player tries to select a slot greater than 9' do
      expect{subject.move('9')}.to raise_error('Invalid slot')
    end
    it 'should raise an error if the player tries to enter a character that is not an integer' do
      expect{subject.move('$')}.to raise_error('Not a valid number')
    end
    it 'should start with player x as the current player' do
      expect(subject.current_player.piece).to eq('x')
    end

  describe '#switch_player' do
    it 'should change the next players turn' do
      subject.switch_player
      expect(subject.current_player.piece).to eq('o')
    end
  end

    describe '#print_board' do
    it 'should display the board' do
      subject.print_board
      expect(subject.print_board).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end
  end
end