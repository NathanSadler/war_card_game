require_relative('playing_card')
require_relative('card_hand')
require_relative('card_deck')

class Game
  attr_reader :game_id
  attr_accessor :players

  def initialize(game_id = 0)
    @deck = CardDeck.new
    @players = []
    @game_id = game_id
  end

  def add_player(player)
    players.push(player)
  end
end
