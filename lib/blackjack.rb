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
    puts_blank_line
    init_app
    show_score(score: @player.score)
    puts_blank_line
    player_draws
    puts "ディーラーの2枚目のカードは#{@dealer.puts_second}でした"
    puts_blank_line
    dealer_draws
    return_result
    puts_last_message
  end

  private

  def init_app
    2.times { @player.draw(@deck) }
    puts_blank_line
    2.times { @dealer.draw(@deck) }
  end

  def player_burst?(score)
    if score > 21
      puts_burst_message('負け')
      puts_last_message
      exit
    end
  end

  def dealer_burst?(score)
    if score > 21
      puts_burst_message('勝ち')
      puts_last_message
      exit
    end
  end

  def player_draws
    loop do
    puts 'カードを引きますか？(yes/no)'
    input = gets.chomp.downcase
      if input == 'yes'
        @player.draw(@deck)
        show_score(score: @player.score)
        player_burst?(@player.score)
      elsif input == 'no'
        break
      else
        puts '不正な値です'
      end
    end
  end

  def dealer_draws
    while @dealer.score <= 17
      @dealer.draw(@deck)
      show_score(who: 'ディーラー', score: @dealer.score)
      puts_blank_line
      dealer_burst?(@dealer.score)
    end
  end

  def return_result
    show_score(who: 'ディーラー', score: @dealer.score)
    if @player.score > @dealer.score
      puts 'あなたの勝ちです'
    elsif @player.score < @dealer.score
      puts 'あなたの負けです'
    else
      puts '引き分けです'
    end
  end

  def show_score(who: 'あなた', score:)
    puts "#{who}の合計得点は#{score}です"
  end

  def puts_blank_line
    puts
  end

  def puts_last_message
    puts_blank_line
    puts '---------- Thank you. Bye! ----------'
  end

  def puts_burst_message(result)
    puts "カードの合計が21を超えました\n\nあなたの#{result}です"
  end
end

if $0 == __FILE__
  BlackJack.run
end
