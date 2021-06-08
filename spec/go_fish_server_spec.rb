require_relative '../lib/card_deck'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/go_fish_server'
require_relative '../lib/playing_card'
require_relative '../lib/connect_client'
require 'socket'
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

  context('.accept_new_client_and_create_person') do
    it("creates and saves a person class") do
      connect_client(server, "Player Name", client_list)
      copy_person = Person.new(GoFishClient.new, name = "Player Name", Player.new)
      expect(server.people[0]).to(eq(copy_person))
    end
  end

  context('.set_clients') do
    it('sets the clients array') do
      @server.set_clients([TCPSocket.new('localhost', 3336),
        TCPSocket.new('localhost', 3336)])
      expect(@server.clients.length).to(eq(2))
    end
  end

  context('.create_game_if_neccessary') do
    it("creates a new game if none have been created yet") do
      server.create_game_if_neccessary
      expect(server.games.length).to(eq(1))
    end
    it("creates a new game if the last one has started") do
      server.create_game
      server.games[0].set_started(true)
      server.create_game_if_neccessary
      expect(server.games.length).to(eq(2))
    end
    it("doesn't create a new game if the last one is available") do
      server.create_game
      server.create_game_if_neccessary
      expect(server.games.length).to(eq(1))
    end
  end

  # TODO: finish this
  context('.assign_people_to_game') do
    it("adds all players to the last available game") do
      2.times {connect_client(server, "Player Name", client_list)}
      server.assign_people_to_game
      server.games[0].set_started(true)
      connect_client(server, "Player Name", client_list)
      server.assign_people_to_game
      expect(server.games[0].people.length).to(eq(2))
      expect(server.games[1].people.length).to(eq(1))
    end
  end

  describe('.add_person_to_last_game') do
    it('adds a person to the last available game') do
      connect_client(server, "Player Name", client_list)
      server.add_client_to_last_game(0)
      expect(server.games[0].player_count).to(eq(1))
    end
    it('creates a game to add a person in if the last one is unavailable') do
      connect_client(server, "Player Name", client_list)
      server.create_game
      server.games[0].set_started(true)
      server.add_client_to_last_game(0)
      expect(server.games[1].player_count).to(eq(1))
    end
  end
end
