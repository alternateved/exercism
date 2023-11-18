class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase
      .scan(/\b[\w']+\b/)      
      .map(&:downcase)
      .tally
  end
end
