module Luhn
  def self.valid?(input)
    str = input.gsub(/\s+/, "")
    return false if str.match?(/\D/) || str.length <= 1

    sum = str
            .chars
            .reverse
            .map.with_index { |el, i| i.odd? ? el.to_i * 2 : el.to_i }
            .sum { |el| el > 9 ? el - 9 : el }

    sum % 10 == 0
  end
end
