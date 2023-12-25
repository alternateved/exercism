module IsbnVerifier
  def self.valid?(string)
    digits = string.delete('-')
    return false unless digits[/^\d{9}[\d|X]$/]

    digits.each_char.with_index
          .sum { |c, i| c == 'X' ? 10 : c.to_i * (10 - i) }
          .modulo(11)
          .zero?
  end
end
