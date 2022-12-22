(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])

(defn today [birds]
  (peek birds))

(defn inc-bird [birds]
  (update birds 6 inc))

(defn day-without-birds? [birds]
  (not (every? pos? birds)))

(defn n-days-count [birds n]
  (transduce (take n) + 0 birds))

(defn busy-days [birds]
  (count (filter #(>= % 5) birds)))

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1]))
