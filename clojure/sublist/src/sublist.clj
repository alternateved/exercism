(ns sublist)

(defn classify
  "Determine relation between provided lists and return it as a keyword."
  [l1 l2]
  (cond
    (= l1 l2) :equal
    (some #(= % l1) (partition (count l1) 1 l2)) :sublist
    (some #(= % l2) (partition (count l2) 1 l1)) :superlist
    :else :unequal))
