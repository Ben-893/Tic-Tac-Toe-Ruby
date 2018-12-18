require 'tictactoe.rb'

describe TicTacToe do

  describe '#move' do
    it 'should allow player x to occupy slot 0' do
      subject.move('0')
      expect(subject.board).to eq(['x', nil, nil, nil, nil, nil, nil, nil, nil])
    end
    it 'should start with player x as the current player' do
      expect(subject.current_player.piece).to eq('x')
    end
    it 'should place a piece in a slot' do
      expect(subject.move('0')).to eq 'x'
    end
  end
  
  describe '#slot_avalible?' do
    it 'should return false if a player tries to use a slot thats already in use' do
      subject.move('0')
      expect(subject.slot_avalible?('0')).to eq false
    end
    it 'should return false if a player tries to select a slot greater than 9' do
      expect(subject.slot_avalible?('9')).to eq false
    end
  end

  describe '#valid?' do
    it 'should return true if the character is valid' do
      expect(subject.valid?('0')).to eq true
    end
    it 'should return nil if the character is not valid' do
      expect(subject.valid?(0)).to eq nil
    end
    it 'should return false if the slot if already taken' do
      allow(subject).to receive(:slot_avalible?).and_return(false)
      expect(subject.valid?('0')).to eq false
    end
  end

  describe '#valid_character?' do
    it 'should return false if the player tries to enter a character that is not a number' do
      expect(subject.valid_character?('$')).to eq nil
    end
  end

  describe '#switch_player' do
    it 'should change the next players turn' do
      subject.switch_player
      expect(subject.current_player.piece).to eq('o')
    end
    it 'should change the next players turn to x' do
      subject.switch_player
      subject.switch_player
      expect(subject.current_player.piece).to eq('x')
    end
  end

  describe '#print_board' do
    it 'should display the board' do
      subject.move('0')
      subject.print_board
      expect(subject.print_board).to eq([['x', nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end
  end

  # describe '#win?' do
  #   it 'should check the board to see if a player has won' do
  #     subject.move('0')
  #     subject.move('1')
  #     subject.move('2')
  #     expect(subject.win?).to eq(true)
  #   end
  # end

  # describe '#draw?' do
  #   it 'should return true if there are not any slots free' do
  #       subject.move('0')
  #       subject.move('1')
  #       subject.move('2')
  #       subject.move('3')
  #       subject.move('4')
  #       subject.move('5')
  #       subject.move('6')
  #       subject.move('7')
  #       subject.move('8')
  #     expect(subject.draw?).to eq(true)
  #   end
  #   it 'should return false if there are any slots free' do
  #     expect(subject.draw?).to eq(false)
  #   end
  # end

  # describe '#game_won?' do
  #   it 'should return true if the game is won' do
  #     allow(subject).to receive(:win?).and_return(true)
  #     expect(subject.game_won?).to eq true
  #   end
  #   it 'should return nil if the game is not won' do
  #     allow(subject).to receive(:win?).and_return(nil)
  #     expect(subject.game_won?).to eq nil
  #   end
  # end
  # describe '#game_over?' do
  #   it 'should return true if the game is won' do
  #     allow(subject).to receive(:game_won?).and_return(true)
  #     expect(subject.game_over?).to eq true
  #   end
  #   it 'should return true if the game is drawn' do
  #     allow(subject).to receive(:game_draw?).and_return(true)
  #     expect(subject.game_over?).to eq true
  #   end
  #   it 'should return false if the game is won' do
  #     allow(subject).to receive(:game_won?).and_return(false)
  #     allow(subject).to receive(:game_draw?).and_return(false)
  #     expect(subject.game_over?).to eq false
  #   end
  #   it 'should return false if the game is not drawn' do
  #     allow(subject).to receive(:game_draw?).and_return(false)
  #     expect(subject.game_over?).to eq false
  #   end
  # end
  # describe '#game_draw' do 
  #   it 'should return true if the game is drawn' do
  #     allow(subject).to receive(:draw?).and_return(true)
  #     expect(subject.game_draw?).to eq true
  #  end
  #   it 'should return nil if the game is not drawn' do
  #     allow(subject).to receive(:draw?).and_return(nil)
  #     expect(subject.game_draw?).to eq nil
  #  end
  # end
end
