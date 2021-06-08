require_relative('playing_card')
require_relative('card_deck')

class Game
  attr_reader :game_id, :started
  attr_accessor :players

  def initialize(id = 0)
    @deck = CardDeck.new
    @players = []
    @people = []
    @game_id = id
    @started = false
  end

  def add_player(player)
    players.push(player)
  end

  def people
    @people
  end

  def set_people(new_people)
    @people = new_people
  end

  # Also sends a notification to all other players in the game
  # that a new player has joined
  def add_person(person)
    people.each do |joined_person|
      joined_person.socket.puts("#{joined_person.name} has joined the game.")
    end
    set_people(people.push(person))

  end

  def set_started(value)
    @started = value
  end

  # Returns the number of players in this game
  def player_count
    players.length
  end

  def send_message_to_people_in_game(message)
    people.each do |person|
      person.socket.puts(message)
    end
  end

end
