class Scrabble
  def initialize(word)
    @word = word
  end

  def score_for_letter(letter)
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" then 1
    when "D", "G" then 2
    when "B", "C", "M", "P" then 3
    when "F", "H", "V", "W", "Y" then 4
    when "K" then 5
    when "J", "X" then 8
    when "Q", "Z" then 10
    end
  end

  def score
    @word
      .upcase
      .chars
      .sum { |l| score_for_letter(l) }
  end
end
