require './lib/deck'
require './lib/card'

class Dealer
  def initialize
    @hands = []
  end

  def draw(deck)
    picked_card = deck.draw_card
    @hands.push(picked_card)
    if @hands.count == 2
      puts 'ディーラーの2枚目のカードはわかりません'
    else
      puts "ディーラーの引いたカードは#{picked_card.show_card}です"
    end
  end

  def score
    @hands.map(&:point)
          .inject { |total, p| total + p }
  end

  def puts_second
    @hands[1].show_card
  end
end
