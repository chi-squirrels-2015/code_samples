require_relative '../player'

describe Player do
  let(:player) { Player.new(:a) }
  it "has a symbol" do
    expect(player.symbol).to eq :a
  end

  it "has a position" do
    expect(player.position).to eq 0
  end

  it "can change its position" do
    expect { player.advance(5) }.to change { player.position }.by(5)
  end
end
