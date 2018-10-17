require 'board.rb'

describe Board do
    it 'should have an empty grid' do
      expect(subject.grid). to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
  end
end