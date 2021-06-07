require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/player'
require_relative '../lib/playing_card'
require_relative '../lib/client'
require_relative '../lib/server'
require_relative '../lib/game'
require_relative '../lib/connect_client'

describe('Player') do
  before(:each) do
    @server = Server.new
    @server.start
    @player = Player.new
    @client_list = []
  end

  let(:server) {@server}
  let(:player) {@player}
  let(:client_list) {@client_list}

  after(:each) do
    server.stop
    client_list.each do |client|
      client.close
    end
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

  context('.add_card_to_hand') do
    it("adds a card to a player's hand") do
      player.add_card_to_hand(PlayingCard.new("4", "C"))
      expect(player.hand.has_card_with_rank?("4")).to(eq(true))
    end
  end

  # TODO: finish after implementing add_card_to_hand
  context('.get_cards_from_player') do
    it("removes cards with a specific rank from a specific player's and and adds"+
    " them to its own hand") do
      test_game = Game.new
      2.times {test_game.add_player(Player.new)}
    end
  end

  # context('.set_client') do
  #   it('sets the client associated with this player') do
  #     test_client = Client.new()
  #     player.set_client(test_client)
  #     expect(player.client).to(eq(test_client))
  #     test_client.close
  #   end
  # end

end
