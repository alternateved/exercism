class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select { |w| w.downcase != @word && w.downcase.chars.sort == @word.chars.sort }
  end
end
