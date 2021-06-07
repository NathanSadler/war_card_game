require_relative('playing_card')

class CardHand

  def initialize
    @card_list = []
  end

  def get_card_list
    return @card_list
  end

  def set_card_list(new_list)
    @card_list = new_list
  end

  def add_card(to_add)
    if to_add.is_a?(Array)
      set_card_list(get_card_list.concat(to_add))
      print(get_card_list)
    else
      set_card_list(get_card_list.push(to_add))
    end
  end

  def has_card_with_rank?(rank)
    selected_cards = get_card_list.select {|card| card.rank == rank}
    selected_cards.length > 0
  end
end
