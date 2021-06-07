require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/server'
require_relative '../lib/playing_card'

def connect_client(server, player_name, client_list)
  client = Client.new(server.port_number)
  client_list.push(client)
  server.accept_new_client
end

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

  # TODO: finish add_client_to_last_game
  describe('.add_client_to_last_game') do
    it('adds a player with a client to the last available game') do
      connect_client(@server, "Player Name", @client_list)
      @server.add_client_to_last_game(0)
      @server.add_client_to_last_game
      expect(@server.games[0].player_count).to(eq(1))
    end
  end
end
