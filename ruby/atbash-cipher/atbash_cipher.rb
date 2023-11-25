module Atbash
  ALPHABET = ("a".."z").to_a
  CIPHER = ALPHABET.reverse

  def self.encode(text)
    text
      .downcase
      .scan(/[a-z0-9]/)
      .map { |char| char.match?(/\D/) ? ALPHABET[-(1 + ALPHABET.index(char))] : char }
      .join
      .scan(/.{1,5}/)
      .join(" ")
  end

  def self.decode(text)
    text
      .scan(/[a-z0-9]/)
      .map { |char| char.match?(/\D/) ? CIPHER[-(1 + CIPHER.index(char))] : char }
      .join
  end
end
