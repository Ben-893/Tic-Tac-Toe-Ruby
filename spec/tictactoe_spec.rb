require 'tictactoe.rb'

describe '#move' do
  it 'should allow player 1 to place a token in slot 1' do
    ticktactoe.move(0)
    expect(tictactoe.board). to eq([true, nil, nil, nil, nil, nil, nil, nil, nil])
    end
  end