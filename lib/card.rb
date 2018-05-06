class Card
  def initialize(mark, num)
    @mark = mark
    @num = num
  end

  def show_card
    "#{@mark}の#{@num}"
  end

  def point
    case @num
    when 11, 12, 13
      10
    else
      @num
    end
  end
end
