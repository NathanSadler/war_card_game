require_relative('playing_card')
require_relative('card_deck')

class Game
  attr_reader :game_id, :started
  attr_accessor :players

  def initialize(id = 0)
    @deck = CardDeck.new
    @players = []
    @game_id = id
    @started = false
  end

  def add_player(player)
    players.push(player)
  end

  def set_started(value)
    @started = value
  end

  # Returns the number of players in this game
  def player_count
    players.length
  end

  # TODO: finish this later
  def send_message_to_players(message)
    players.each do |player|
      player.client.socket.puts(message)
    end
  end
end
