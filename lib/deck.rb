require './lib/card'

class Deck
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
    ['ハート', 'スペード', 'ダイヤ', 'クラブ'].each do |mark|
      (1..13).each do |num|
        @cards.push(Card.new(mark, num))
        @cards.shuffle!
      end
    end
  end

  def draw_card
    @cards.pop
  end
end
