class InvalidCodonError < StandardError
end

module Translation
  def self.translate(codon)
    case codon
    when "AUG" then "Methionine"
    when "UUU", "UUC" then "Phenylalanine"
    when "UUA", "UUG" then "Leucine"
    when "UCU", "UCC", "UCA", "UCG" then "Serine"
    when "UAU", "UAC" then "Tyrosine"
    when "UGU", "UGC" then "Cysteine"
    when "UGG" then "Tryptophan"
    when "UAA", "UAG", "UGA" then "STOP"
    else raise InvalidCodonError.new
    end
  end

  def self.of_rna(strand)
    codons = strand.chars.each_slice(3).map(&:join)
    proteins = []

    codons.each do |codon|
      protein = translate(codon)
      break if protein == "STOP"
      proteins << protein
    end

    proteins
  end
end
