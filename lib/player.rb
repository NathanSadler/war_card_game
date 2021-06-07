require_relative('playing_card')
require_relative('card_hand')

class Player
  attr_accessor :hand, :name
  attr_reader  :id, :client

  def initialize(id = 0, name = nil)
    @hand = CardHand.new
    @name = name
    @id = id
    @client = nil
  end

  def add_card_to_hand(card)
    hand.add_card(card)
  end

  def get_cards_from_player(rank, player)
    # This will try to get cards with a specific rank from
    # another player, but more needs to be done before
    # this can be implemented
  end

  def set_client(client)
    @client = client
  end


  # Be sure to override hash later!
  def ==(other_player)
    ((id == other_player.id) && (name == other_player.name))
  end

end
