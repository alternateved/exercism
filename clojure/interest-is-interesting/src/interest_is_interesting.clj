(ns interest-is-interesting)

(defn interest-rate
  "Calculate the interest rate based on the provided balance."
  [balance]
  (cond
    (< balance 0) -3.213
    (< balance 1000) 0.5
    (and (>= balance 1000) (< balance 5000)) 1.621
    :else 2.475))

(defn annual-balance-update
  "Calculate annual balance update."
  [balance]
  (+ balance (* balance (bigdec (abs (interest-rate balance))) 0.01M)))

(defn amount-to-donate
  "Calculate how much money to donate to charities based on the balance and the
  tax-free percentage that the government allows."
  [balance tax-free-percentage]
  (if (neg? balance)
    0
    (int (* 2 balance tax-free-percentage 0.01))))

