require './lib/card'

class Deck
  MARKS = %w(ハート スペード ダイヤ クラブ)
  NUMBERS = [*1..13]

  def initialize
    @cards = []
    generate_deck
  end

  def show_deck
    @cards.each do |card|
      card.show_card
    end
  end

  def generate_deck
    MARKS.each do |mark|
      NUMBERS.each do |num|
        @cards.push(Card.new(mark, num))
        @cards.shuffle!
      end
    end
  end

  def draw_card
    @cards.pop
  end
end
