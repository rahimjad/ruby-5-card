class Card

  attr_reader :value, :suit, :point
  attr_accessor :update_point

  def initialize(value, suit)
    @value = value
    @suit = suit
    @point
    update_point
  end

  private 

  def update_point
    case @value
    when :A then @point = 14
    when :K then @point = 13
    when :Q then @point = 12
    when :J then @point = 11
    else  
      @point = @value 
    end
  end

end