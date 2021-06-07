require 'socket'
require_relative '../lib/server'
require_relative '../lib/client'
require_relative '../lib/player'
require_relative '../lib/playing_card'

def connect_client(server, player_name, client_list)
  client = Client.new(server.port_number)
  client_list.push(client)
  server.accept_new_client
end


describe 'Client' do
  before(:each) do
    @server = Server.new
    @clients = []
    @server.start
    connect_client(@server, "Player Name", @clients)
    @test_client = @clients[0]
  end

  after(:each) do
    @server.stop
    @clients.each do |client|
      client.close
    end
  end

  context('.set_clients') do
    it('sets the clients array') do
      @server.set_clients([Client.new, Client.new])
      expect(@server.clients.length).to(eq(2))
    end
  end

end
