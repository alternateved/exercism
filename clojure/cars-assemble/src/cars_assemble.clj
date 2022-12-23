(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [cars-produced (float (* 221 speed))]
    (cond
      (= speed 0) cars-produced
      (and (>= speed 1) (<= speed 4)) cars-produced
      (and (>= speed 5) (<= speed 8)) (* cars-produced 90/100)
      (= speed 9) (* cars-produced 80/100)
      :else (* cars-produced 77/100))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))

