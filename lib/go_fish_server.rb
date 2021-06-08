require_relative 'go_fish_client'
require_relative 'game'
require_relative 'player'
require 'socket'
require_relative "person"

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

  def accept_new_client_and_create_person(go_fish_client=nil, name=nil)
    socket = @server.accept_nonblock
    people.push(Person.new(go_fish_client, name, Player.new, socket))
    rescue IO::WaitReadable
      @output = ""
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
    unassigned_people = people.select { |person| !person.in_game }
    unassigned_people.each do |person|
      create_game_if_neccessary
      games[-1].add_person(person)
      person.set_in_game(true)
    end
  end

  def create_game_if_neccessary
    if (games.empty? || games[-1].started)
      games.push(Game.new)
    end
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
