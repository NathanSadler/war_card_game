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

describe('Game') do

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

  let(:game) {@game}
  let(:server) {@server}
  let(:client_list) {@client_list}

  describe('.add_player') do
    it('adds a player to the game') do
      game.add_player(Player.new)
      expect(game.players).to(eq([Player.new]))
    end
  end

  context('.player_count') do
    it('returns the number of players in a game') do
      2.times {game.add_player(Player.new)}
      expect(game.player_count).to(eq(2))
    end
  end

  ## TODO:  finish send_message_to_players_in_game
  context('.send_message_to_players_in_game') do
    it('sends a message to all players in the game') do
      4.times {connect_client(server, "Player Name", client_list)}

    end
  end
end
