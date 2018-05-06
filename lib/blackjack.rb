require './lib/deck'
require './lib/player'
require './lib/dealer'

class BlackJack
  def self.run
    self.new.run
  end

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def run
    puts '---------- Welcome to Blackjack ----------'
    puts_blank_line
    puts 'ゲームを開始します'
    init_app
    puts "あなたの合計得点は#{@player.score}です"

    loop do
    puts 'カードを引きますか？(yes/no)'
      input = gets.chomp
      if input == 'yes'
        @player.draw(@deck)
        puts "あなたの合計得点は#{@player.score}です"
        player_burst?(@player.score)
      elsif input == 'no'
        break
      else
        puts "不正な値です"
      end
    end

    while @dealer.score <= 17
      @dealer.draw(@deck)
      puts "ディーラーの合計得点は#{@dealer.score}です"
      dealer_burst?(@dealer.score)
    end

    # 両者がカードを引き終えた時の処理
    puts "あなたの合計得点は#{@player.score}です"
    puts "ディーラーの合計得点は#{@dealer.score}です"
    if @player.score > @dealer.score
      puts 'あなたの勝ちです'
    elsif @player.score < @dealer.score
      puts 'あなたの負けです'
    else
      puts '引き分けです'
    end

  end

  def init_app
    2.times { @player.draw(@deck) }
    2.times { @dealer.draw(@deck) }
  end

  def puts_blank_line
    puts
  end

  def player_burst?(score)
    if score > 21
      puts "カードの合計が21を超えました\nあなたの負けです"
      exit
    end
  end

  def dealer_burst?(score)
    if score > 21
      puts "カードの合計が21を超えました\nあなたの勝ちです"
      exit
    end
  end
end

if $0 == __FILE__
  BlackJack.run
end
