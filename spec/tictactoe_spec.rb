require 'tictactoe.rb'

describe TicTacToe do

  describe '#move' do
    it 'should allow player 1 to occupy slot 0' do
      subject.move(0)
      expect(subject.board).to eq([true, nil, nil, nil, nil, nil, nil, nil, nil])
      end
    end
    it 'should raise an error if a player tries to use a slot thats already taken' do
      subject.move(0)
      expect{subject.move(0)}.to raise_error('Slot is in use')
    end
    it 'should raise an error if a player tries to select a slot greater than 9' do
      expect{subject.move(9)}.to raise_error('Invalid Slot')
    end
    it 'should raise an error if the player tries to enter a character that is not an integer' do
      expect{subject.move("$")}.to raise_error('Not a valid number')
    end
  end