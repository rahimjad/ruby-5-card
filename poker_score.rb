class PokerScore

  attr_reader :hand, :score

  def initialize(hand)
    @hand = hand
    @score = []
  end

  #find the high card of the hand
  def high_card
    @hand.max_by{|card| card.point}.point.to_i
  end

  #return value of the pair cards if there are two of a kind
  def one_pair
    if is_two_pair?
      repetitions(2).keys.min.to_i
    elsif is_one_pair?
      repetitions(2).keys.max.to_i
    else
      0
    end     
  end

  #return the value of the highest pair card if there are two pairs
  def two_pair
    is_two_pair? ? repetitions(2).keys.max.to_i : 0 
  end

  #return the value of the triple cards if there are three of a kind
  def three_of_a_kind
    repetitions(3).keys.count ? repetitions(3).keys.max.to_i : 0
  end

  #return the value of the three simillar cards if there is a full house
  def full_house
    repetitions(2).any? && repetitions(3).any? ? repetitions(3).keys.max.to_i : 0 
  end

  #return the card value of the set of four 
  def four_of_a_kind
    repetitions(4).any? ? repetitions(4).keys.max.to_i : 0
  end

  #return the highest value of the hand if its a flush
  def flush
    is_flush? ? high_card : 0
  end

  #return the highest value of the hand if its a straight
  def straight
    is_straight? ? high_card : 0
  end

  #return the highest value of the hand if its a straight
  def straight_flush
    is_straight_flush? ? high_card : 0
  end

  #an array placing the highest scoring combination first
  def score
    @score = [straight_flush, four_of_a_kind, full_house, flush, straight, three_of_a_kind, two_pair, one_pair, high_card]
  end

  private

  #check if only one pair exists
  def is_one_pair?
    repetitions(2).keys.count == 1
  end 

  #check if exactly two pair exists
  def is_two_pair?
    repetitions(2).keys.count == 2
  end

  #check if all cards in hand are from same suit
  def is_flush?
    @hand.all? {|card| card.suit == @hand[0].suit}
  end

  #check if there is a straight
  def is_straight?
    order_by_value.each_cons(2).all? { |x,y| y.point == x.point + 1 }
  end

  #check if there is a straight_flush
  def is_straight_flush?
    is_flush? && is_straight?
  end

  #checks for a card repeted n amount of times
  def repetitions(n)
    @hand.group_by{ |card| card.point }.select { |k, v| v.count == n }
  end

  #orders the hand by value
  def order_by_value
    @hand = @hand.sort_by{|card| card.point }
  end
end