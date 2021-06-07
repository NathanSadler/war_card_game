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

  describe('.set_cards') do
    it('sets the cards of the player') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("7", "D")
      player.set_cards([card_a, card_b])
      expect(player.cards).to(eq([card_a, card_b]))
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

  describe('.has_card_with_rank?') do
    it('returns true if it has a card with a given rank') do
      player.add_card_to_hand(PlayingCard.new('3', 'C'))
      expect(player.has_card_with_rank?('3')).to(eq(true))
    end
    it('returns false if it does not have a card with a given rank') do
      player.add_card_to_hand(PlayingCard.new('4', 'D'))
      expect(player.has_card_with_rank?('K')).to(eq(false))
    end
  end

  context('.add_card_to_hand') do
    it("adds a card to a player's hand") do
      player.add_card_to_hand(PlayingCard.new("4", "C"))
      expect(player.cards).to(eq([PlayingCard.new("4", "C")]))
    end
  end

  describe('.remove_cards_with_rank') do
    it('removes all cards with a given rank from the hand and returns them') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("7", "D")
      card_c = PlayingCard.new("7", "S")
      player.add_card_to_hand([card_a, card_b, card_c])
      expect(player.remove_cards_with_rank("7")).to(eq([card_b, card_c]))
      expect(player.cards).to(eq([card_a]))
    end
    it('returns an empty array if there are no cards with the given rank in the hand') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("5", "S")
      player.add_card_to_hand([card_a, card_b])
      expect(player.remove_cards_with_rank("6")).to(eq([]))
    end
  end

  # TODO: finish this
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
