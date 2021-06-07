require_relative '../lib/card_deck'
#require_relative '../lib/playing_card'

describe 'CardHand' do
  before(:each) do
    @hand = CardHand.new
  end

  describe('.add_card') do
    it('takes a card and adds it to the hand') do
      @hand.add_card(PlayingCard.new('3', 'C'))
      expect(@hand.has_card_with_rank?('C')).to(eq(true))
    end
    it('adds every card in an array if it recieves an array') do
      @hand.add_card([PlayingCard.new('3', 'C'), PlayingCard.new('4', 'S')])
      expect(@hand.has_card_with_rank('C')).to(eq(true))
      expect(@hand.has_card_with_rank('S')).to(eq(true))
    end
  end

  describe('.has_card_with_rank?') do
    it('returns true if it has a card with a given rank') do
      @hand.add_card(PlayingCard.new('3', 'C'))
      expect(@hand.has_card_with_rank?('C')).to_eq(true)
    end
    it('returns false if it does not have a card with a given rank') do
      @hand.add_card(PlayingCard.new('4', 'D'))
      expect(@hand.has_card_with_rank?('S')).to(eq(false))
    end
  end
end
