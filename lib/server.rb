require 'go_fish_client'
require 'game'
require 'player'
require 'socket'
require "person"

class Server
  attr_reader :clients, :sockets

  def initialize
    @clients = []
    @people = []
  end

  def people
    @people
  end

  def port_number
    3336
  end

  def set_clients(clients)
    @clients = clients
  end

  def accept_new_client_and_create_person(go_fish_client, name=nil)
    client = @server.accept_nonblock
    clients.push(client)
    people.push(Person.new(go_fish_client, name, Player.new))
  end

  def games
    @games ||= []
  end

  def add_client_to_last_game(client_index)
    player_to_add = Player.new(client_index, "User #{client_index}")
    player_to_add.set_client(clients[client_index])
    if (games.empty? || games[-1].started)
      games.push(Game.new)
    end
    games[-1].add_player(player_to_add)
  end

  # Add every player not in a game to a new game
  def assign_people_to_game
    
  end

  def start
    @server = TCPServer.new(port_number)
  end

  def stop
    @server.close if @server
  end

  def create_game
    games.push(Game.new)
  end

end
