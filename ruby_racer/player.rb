class Player
  attr_reader :symbol, :position

  def initialize(symbol)
    @symbol = symbol
    @position = 0
  end

  def advance(number)
    self.position = position + number
  end

  private
  attr_writer :position
end
