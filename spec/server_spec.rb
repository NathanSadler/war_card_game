require_relative '../lib/card_deck'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/server'
require_relative '../lib/playing_card'
require_relative '../lib/connect_client'
require 'pry'

describe('Server') do
  before(:each) do
    @game = Game.new
    @server = Server.new
    @client_list = []
    @server.start
  end

  after(:each) do
    @server.stop
    @client_list.each do |client|
      client.close
    end
  end

  let(:server) {@server}
  let(:game) {@game}
  let(:client_list) {@client_list}

  context('.create_game') do
    it('creates a new game') do
      server.create_game
      expect(server.games.length).to(eq(1))
    end
  end

  context('.accept_new_client') do
    it("creates and saves a person class") do
      
    end
  end

  describe('.add_client_to_last_game') do
    it('adds a player with a client to the last available game') do
      connect_client(server, "Player Name", client_list)
      server.add_client_to_last_game(0)
      expect(server.games[0].player_count).to(eq(1))
    end
    it('creates a game to add a player in if the last one is unavailable') do
      connect_client(server, "Player Name", client_list)
      server.create_game
      server.games[0].set_started(true)
      server.add_client_to_last_game(0)
      expect(server.games[1].player_count).to(eq(1))
    end
  end
end
