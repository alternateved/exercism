(ns robot-name)

(def robots (atom #{}))

(defn rand-letter []
  (rand-nth (map char (range (int \A) (inc (int \Z))))))

(defn gen-name []
  (->> (repeatedly 2 rand-letter)
       (into (repeatedly 3 #(rand-int 10)))
       (apply str)))

(defn name-taken? [n]
  (contains? @robots n))

(defn robot []
  (let [name (gen-name)]
    (if (name-taken? name) (recur)
        (do (swap! robots conj name)
            (atom name)))))

(defn robot-name [r] @r)

(defn reset-name [r]
  (let [name (gen-name)]
    (if (name-taken? name) (recur r)
        (do (swap! robots conj name)
            (reset! r name)))))
