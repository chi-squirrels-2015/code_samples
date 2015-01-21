class Die
  attr_reader :sides

  def initialize(sides = 6)
    @sides = sides
  end

  def roll
    rand(1..sides)
  end
end
