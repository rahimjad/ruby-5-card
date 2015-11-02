class Deck
  attr_reader :cards, :hands
  attr_accessor :create_deck

  def initialize
    @cards = []
    @hands = []
    create_deck
  end

  def draw(n)
    @cards.shift(n)
  end

  def shuffle
    @cards = @cards.shuffle
  end

  private

  def create_deck
    values = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :K, :Q]
    suit = [:♠, :♥, :♦, :♣]

    values.each do |value|
      suit.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end
end