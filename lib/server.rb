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

  def start
    @server = TCPServer.new(port_number)
  end

  def stop
    @server.close if @server
  end


end
