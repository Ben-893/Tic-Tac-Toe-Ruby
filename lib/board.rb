class Board

attr_reader :grid

  def initialize
    @grid = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def valid_character?(slot)
    slot =~ /^-?[0-9]+$/
  end

  def valid?(slot)
    valid_character?(slot) && slot_available?(slot)
  end

  def slot_available?(slot)
    new_slot = slot.to_i
    @grid[new_slot] == nil && new_slot <= @grid.size - 1
  end

  def print
    @grid.each_slice(3).to_a.each do |i|
      puts i.to_s.tr(',', '|').tr('[', '|').tr(']', '|').tr(' ', '|')
    end
  end
end