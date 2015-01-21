require_relative '../ruby_racer'

describe RubyRacer do
  let(:player_1) { double("a", { symbol: "a", position: 0, advance: nil } ) }
  let(:player_2) { double("b", symbol: "b", position: 7, advance: nil) }
  let(:players) { [player_1, player_2] }

  let(:track_length) { 30 }

  let(:die) { double("die", roll: 5) }

  let(:game) { RubyRacer.new(players, track_length, die) }

  it "has a track length" do
    expect(game.length).to eq track_length
  end

  it "has players" do
    expect(game.players).to match_array players
  end

  it "has a die" do
    expect(game.die).to eq die
  end

  describe "#play" do
    it "checks to see if the game is over" do
      allow(game).to receive(:play_round)
      allow(game).to receive(:finished?) { true }

      expect(game).to receive(:finished?)
      game.play
    end

    it "it played in rounds" do
      allow(game).to receive(:finished?).and_return(false, true)

      expect(game).to receive(:play_round)
      game.play
    end
  end

  describe "#finished?" do
    it "knows when the game is over" do
      allow(game).to receive(:winner).and_return(player_1)

      expect(game.finished?).to be true
    end

    it "knows when the game is still going" do
      allow(game).to receive(:winner).and_return(nil)

      expect(game.finished?).to be false
    end
  end

  describe "#winner" do
    it "returns nothing if there's no winner" do
      expect(game.winner).to be_nil
    end

    it "returns the winner" do
      allow(player_1).to receive(:position).and_return(track_length)

      expect(game.winner).to eq player_1
    end
  end

  describe "#play_round" do
    it "advances each player" do
      players.each { |player| expect(player).to receive(:advance) }

      game.play_round
    end

    it "stops if a player reaches the finish line" do
      allow(players).to receive(:shuffle).and_return(players)
      allow(game).to receive(:finished?).and_return(true)

      expect(player_1).to receive(:advance).once
      expect(player_2).to_not receive(:advance)

      game.play_round
    end
  end

  describe "#to_s" do
    it "creates a string that looks like tracks" do
      allow(game).to receive(:length).and_return(5)

      desired_board = "a |   |   |   |  \n  |   |   |   | b"

      expect(game.to_s).to eq desired_board
    end
  end
end
