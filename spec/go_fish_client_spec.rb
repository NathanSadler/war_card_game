require 'socket'
require_relative '../lib/server'
require_relative '../lib/go_fish_client'
require_relative '../lib/player'
require_relative '../lib/playing_card'
require_relative '../lib/connect_client'

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

end
