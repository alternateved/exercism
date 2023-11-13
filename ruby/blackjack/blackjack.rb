module Blackjack
  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten' then 10
    when 'jack' then 10
    when 'queen' then 10
    when 'king' then 10
    else 0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    else 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    range = card_range(card1, card2)
    dealer_value = parse_card(dealer_card)
    case
    when card1 == 'ace' && card2 == 'ace'
      'P'
    when range == 'blackjack' && dealer_value < 10
      'W'
    when range == 'blackjack' && dealer_value >= 10
      'S'
    when range == 'high'
      'S'
    when range == 'mid' && dealer_value < 7
      'S'
    when range == 'mid' && dealer_value >= 7
      'H'
    else
      'H'
    end
  end
end
