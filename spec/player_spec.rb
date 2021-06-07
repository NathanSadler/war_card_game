require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/player'
require_relative '../lib/playing_card'

describe('Player') do
  before(:each) do
    @player = Player.new
  end
  describe('==') do
    it('is true if both players have the same ID') do
      expect(Player.new(0, "John Doe")).to(eq(Player.new(0, "John Doe")))
    end
    it('is false if the players do not have the same ID') do
      expect(Player.new(0, "John Doe") == Player.new(1, "John Doe")).to(eq(false))
    end
    it("is false if the players have different names") do
      expect(Player.new(0, "John Doe") == Player.new(0, "Jane Doe")).to(eq(false))
    end
  end
end
