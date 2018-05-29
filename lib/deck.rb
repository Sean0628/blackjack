require './lib/card'

class Deck
  MARKS = %w[ハート スペード ダイヤ クラブ].freeze
  NUMBERS = [*1..13]

  def initialize
    @cards = []
    generate_deck
  end

  def show_deck
    @cards.each(&:show_card)
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
