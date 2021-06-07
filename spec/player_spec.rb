require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/player'
require_relative '../lib/playing_card'
require_relative '../lib/client'
require_relative '../lib/server'

describe('Player') do
  before(:each) do
    @server = Server.new
    @server.start
    @player = Player.new
    @clients = []
  end

  after(:each) do
    @server.stop
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

  context('.set_client') do
    it('sets the client associated with this player') do
      test_client = Client.new()
      @player.set_client(test_client)
      expect(@player.client).to(eq(test_client))
      test_client.close
    end
  end

end
