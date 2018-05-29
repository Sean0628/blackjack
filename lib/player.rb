require './lib/deck'
require './lib/card'

class Player
  def initialize
    @hands = []
  end

  def draw(deck)
    picked_card = deck.draw_card
    @hands.push(picked_card)
    puts "あなたの引いたカードは#{picked_card.show_card}です"
  end

  def score
    @hands.map(&:point)
          .inject { |total, p| total + p }
  end
end
