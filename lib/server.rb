require 'client'
require 'game'
require 'player'
require 'socket'

class Server
  attr_reader :clients

  def initialize
    @clients = []
  end

  def port_number
    3336
  end

  def set_clients(clients)
    @clients = clients
  end

  def accept_new_client
    client = @server.accept_nonblock
    @clients.push(client)
  end

  def games
    @games ||= []
  end

  def add_client_to_last_game(client_index)
    if (games.empty? || games[-1].started)
      games.push(Game.new)
    end
    games[-1].add_player(clients[client_index])
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
