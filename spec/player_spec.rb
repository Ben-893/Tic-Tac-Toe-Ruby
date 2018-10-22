require 'player.rb'

describe Player do
  let(:player) { Player.new('x') }
  it 'should start as player x turn' do
    expect(player.piece).to eq('x')
  end
end