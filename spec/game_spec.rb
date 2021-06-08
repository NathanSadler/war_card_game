require_relative '../lib/card_deck'
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

  context('.add_person') do
    it("adds a person to the game") do
      default_person = Person.new
      game.add_person(default_person)
      expect(game.people).to(eq([default_person]))
    end
  end

  context('.send_message_to_people_in_game') do
    it('sends a message to all people in the game') do
      4.times {connect_client(server, "Player Name", client_list)}
      server.assign_people_to_game
      connect_client(server, "Player Name", client_list)
      server.games[0].send_message_to_people_in_game("Hello World")
      expect(client_list[0].capture_output.include?("Hello World")).to(eq(true))
      expect(client_list[-1].capture_output.include?("Hello World")).to(eq(false))
    end
  end
end
