require_relative "card"
require_relative "deck"
require_relative "poker_score"
require 'pry' 

def compare_scores(score1, score2)
  result = score1 <=> score2
  case result
  when 1 then puts "----Hand 1 wins----"
  when -1 then puts "----Hand 2 Wins----"
  when 0 then puts "----Its a TIE!!----"
  end
end

@deck = Deck.new

@deck.shuffle

@hand1 = @deck.draw(5)

@hand2 = @deck.draw(5)

@score1 = PokerScore.new(@hand1).score

@score2 = PokerScore.new(@hand2).score

puts "----hand 1----"

@hand1.each do |card|
  puts "#{card.suit} : #{card.value}"
end

puts "----hand 2----"
@hand2.each do |card|
  puts "#{card.suit} : #{card.value}"
end


puts "hand 1 score: #{@score1}" 
puts "hand 2 score: #{@score2}" 

puts compare_scores(@score1, @score2)

# puts "----------CARDSSSS LEFT----------------"
# puts @deck.cards.count
# @deck.cards.each do |card|
#   puts "#{card.value} - #{card.suit}"
# end

# card1 = Card.new(6, :♠)
# card2 = Card.new(6, :♠)
# card3 = Card.new(6, :♠)
# card4 = Card.new(4, :♠)
# card5 = Card.new(4, :♠)
# hand = [card1, card2, card3, card4, card5]
# pscore = PokerScore.new(hand)


# card1_2 = Card.new(6, :♠)
# card2_2 = Card.new(6, :♠)
# card3_2 = Card.new(6, :♠)
# card4_2 = Card.new(4, :♠)
# card5_2 = Card.new(4, :♠)
# hand2 = [card1_2, card2_2, card3_2, card4_2, card5_2]
# pscore2 = PokerScore.new(hand2)


# print pscore.score
# print pscore2.score