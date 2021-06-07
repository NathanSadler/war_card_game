require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/playing_card'

describe('Game') do
  before(:each) do
    @game = Game.new
  end

  describe('.add_player') do
    it('adds a player to the game') do
      @game.add_player(Player.new)
      expect(@game.players).to(eq([Player.new]))
    end
  end
end
