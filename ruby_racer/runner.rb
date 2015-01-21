require_relative('die')
require_relative('player')
require_relative('ruby_racer')
require_relative('reset_screen')



players = ("A".."Z").map { |symbol| Player.new(symbol) }
die = Die.new(2)
game = RubyRacer.new(players, 48, die)




# Initial display of the game
ResetScreen.call(game, 2)

until game.finished?
  game.play_round
  ResetScreen.call(game, 0.15)
end

puts "\n\nThe winner is #{game.winner.symbol}!\n\n"
