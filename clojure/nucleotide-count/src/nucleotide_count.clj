(ns nucleotide-count)

(def nucleotides {\A 0, \T 0, \C 0, \G 0})

(defn nucleotide?
  "Returns true if n is a nucleotide (is an A, C, G, or T character)."
  [n]
  (contains? (set (keys nucleotides)) n))

(defn count-of-nucleotide-in-strand
  "Given a nucleotide and a DNA strandreturns
  a count of that nucleotide in a strand."
  [n s]
  (if (nucleotide? n)
    (get (merge nucleotides (frequencies s)) n)
    (throw (AssertionError. "Provided invalid nucleotide."))))

(defn nucleotide-counts
  "Returns a count of all nucleotides in provided DNA strand."
  [s]
  (merge nucleotides (frequencies s)))
