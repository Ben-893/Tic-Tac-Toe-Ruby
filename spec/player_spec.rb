require 'player.rb'

describe Player do
  let(:player) { Player.new('x') }
  it 'is initialized with a piece' do
    expect(player.piece).to eq('x')
  end
end