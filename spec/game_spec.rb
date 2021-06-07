require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/server'
require_relative '../lib/playing_card'
require_relative '../lib/connect_client'

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
      (0..3).each {|index| server.add_client_to_last_game(index)}

      connect_client(server, "Player Name", client_list)
      game.send_message_to_players("Hello World")

      # [0..3].each {|index| expect(client_list[index].capture_output.include?(
      #   "Hello World")).to(eq(true))}
      message = client_list[0].capture_output
      #binding.pry
      #expect(client_list[0].capture_output.include?("Hello World")).to(eq(true))
      expect(client_list[0].capture_output.include?("Hello World")).to(eq(true))
      expect(client_list[-1].capture_output.include?("Hello World")).to(eq(false))
    end
  end
end
