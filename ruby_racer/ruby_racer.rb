class RubyRacer
  attr_reader :players, :length, :die

  def initialize(players, length, die)
    @players = players
    @length = length
    @die = die
  end

  def play
    until finished?
      play_round
    end
  end

  def finished?
    !(winner.nil?)
  end

  def winner
    players.find { |player| player.position >= last_track_position }
  end

  def play_round
    players.shuffle.each do |player|
      player.advance(die.roll)
      break if finished?
    end
  end

  def to_s
    tracks = players.map do |player|
               track = Array.new(length) { " " }
               track_position = [player.position, last_track_position].min

               track[track_position] = player.symbol
               track.join(" | ")
             end

    tracks.join("\n")
  end

  private
  def last_track_position
    length - 1
  end
end
