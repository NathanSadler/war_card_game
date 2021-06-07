require_relative('playing_card')
require_relative('card_hand')

class Player
  attr_accessor :name
  attr_reader  :id, :client, :cards

  def initialize(id = 0, name = nil)
    @cards = []
    @name = name
    @id = id
    @client = nil
  end

  def add_card_to_hand(to_add)
    if to_add.is_a?(Array)
      set_cards(cards.concat(to_add))
    else
      set_cards(cards.push(to_add))
    end
  end

  def get_cards_from_player(rank, player)
    # This will try to get cards with a specific rank from
    # another player, but more needs to be done before
    # this can be implemented
  end

  def set_client(client)
    @client = client
  end

  def set_cards(card_list)
    @cards = card_list
  end

  def has_card_with_rank?(rank)
    selected_cards = cards.select {|card| card.rank == rank}
    selected_cards.length > 0
  end

  def remove_cards_with_rank(rank)
    cards_with_rank = cards.select {|card| card.rank == rank}
    set_cards(cards.difference(cards_with_rank))
    cards_with_rank
  end

  # Be sure to override hash later!
  def ==(other_player)
    ((id == other_player.id) && (name == other_player.name))
  end

end
