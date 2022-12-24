(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [[card & cards]]
  card)

(defn second-card
  "Returns the second card from deck."
  [[card1 card2 & cards]]
  card2)

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [[card1 card2 & cards]]
  (vec (concat [card2 card1] cards)))

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [[card1 & cards]]
  [card1 cards])

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [[card1 & cards]]
  (vec (remove nil? (concat [card1] face-cards cards))))
