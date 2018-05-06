require './lib/deck'
require './lib/card'

class Dealer
  def initialize
    @hands = []
  end

  def draw(deck)
    picked_card = deck.draw_card
    @hands.push(deck.draw_card)
    if @hands.count == 2
      puts 'ディーラーの２枚目のカードはわかりません'
    else
      puts "ディーラーの引いたカードは#{picked_card.show_card}です"
    end
  end

  def score
    @hands.map { |card| card.point }
          .inject { |total, p| total + p }
  end
end
