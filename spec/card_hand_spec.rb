require_relative '../lib/card_deck'
require_relative '../lib/card_hand'
require_relative '../lib/playing_card'
require_relative '../lib/connect_client'

describe 'CardHand' do
  before(:each) do
    @hand = CardHand.new
  end

  describe('.add_card') do
    it('takes a card and adds it to the hand') do
      @hand.add_card(PlayingCard.new('3', 'C'))
      expect(@hand.has_card_with_rank?('3')).to(eq(true))
    end
    it('adds every card in an array if it recieves an array') do
      @hand.add_card([PlayingCard.new('3', 'C'), PlayingCard.new('4', 'S')])
      expect(@hand.has_card_with_rank?('3')).to(eq(true))
      expect(@hand.has_card_with_rank?('4')).to(eq(true))
    end
  end

  describe('.get_card_list') do
    it('returns a list of cards in the hand') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("7", "D")
      @hand.set_card_list([card_a, card_b])
      expect(@hand.get_card_list).to(eq([card_a, card_b]))
    end
  end

  describe('.set_card_list') do
    it('sets the list of cards') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("7", "D")
      @hand.set_card_list([card_a, card_b])
      expect(@hand.get_card_list).to(eq([card_a, card_b]))
    end
  end

  describe('.has_card_with_rank?') do
    it('returns true if it has a card with a given rank') do
      @hand.add_card(PlayingCard.new('3', 'C'))
      expect(@hand.has_card_with_rank?('3')).to(eq(true))
    end
    it('returns false if it does not have a card with a given rank') do
      @hand.add_card(PlayingCard.new('4', 'D'))
      expect(@hand.has_card_with_rank?('K')).to(eq(false))
    end
  end

  describe('.remove_cards_with_rank') do
    it('removes all cards with a given rank from the hand and returns them') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("7", "D")
      card_c = PlayingCard.new("7", "S")
      @hand.add_card([card_a, card_b, card_c])
      expect(@hand.remove_cards_with_rank("7")).to(eq([card_b, card_c]))
      expect(@hand.get_card_list).to(eq([card_a]))
    end
    it('returns an empty array if there are no cards with the given rank in the hand') do
      card_a = PlayingCard.new("4", "S")
      card_b = PlayingCard.new("5", "S")
      @hand.add_card([card_a, card_b])
      expect(@hand.remove_cards_with_rank("6")).to(eq([]))
    end
  end
end
