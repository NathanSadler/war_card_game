require_relative '../lib/card_deck'
require_relative '../lib/player'
require_relative '../lib/playing_card'
require_relative '../lib/go_fish_client'
require_relative '../lib/server'
require_relative '../lib/game'
require_relative '../lib/person'
require_relative '../lib/connect_client'

describe 'Person' do
  before(:each) do
    @person = Person.new()
    @server = Server.new
    @server.start
  end

  let(:person) {@person}
  let(:server) {@server}

  after(:each) do
    server.stop
  end

  context('.set_name') do
    it("sets the person's name") do
      person.set_name("John Doe")
      expect(person.name).to(eq("John Doe"))
    end
  end

  context('.set_player') do
    it("sets the Player object associated with the Person") do
      person.set_player(Player.new)
      expect(person.player).to(eq(Player.new))
    end
  end

  context('.set_go_fish_client') do
    it("sets the GoFishClient associated with the Person") do
      new_client = GoFishClient.new
      person.set_go_fish_client(new_client)
      # Only checks if it is nil since there isn't an equality operator
      # for GoFishClient
      expect(person.go_fish_client.nil?).to(eq(false))
      new_client.close
    end
  end

  context('.==') do
    before(:each) do
      @test_person = Person.new(nil, "Test Player", Player.new)
    end

    let(:test_person) {@test_person}
    it("is true if the name and player are equal") do
      expect(test_person).to(eq(Person.new(nil, "Test Player", Player.new)))
    end
    it("is false if the names are different") do
      second_person = Person.new(nil, "New Player", Player.new)
      expect(test_person == second_person).to(eq(false))
    end
    it("is false if the Player objects are different") do
      second_person = Person.new(nil, "Test Player", Player.new(1))
      expect(test_person == second_person).to(eq(false))
    end
  end
end
