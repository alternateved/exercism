(ns robot-name)

(def active-robots
  "Global state of active robots."
  (atom #{}))

(defn rand-letter 
  "Returns a random capital letter between A and Z."
  [] (rand-nth (map char (range (int \A) (inc (int \Z))))))

(defn gen-name
  "Generate a random name in the format of two uppercase letters
  followed by three digits, such as RX837 or BC811."
  [] (->> (repeatedly 2 rand-letter)
          (into (repeatedly 3 #(rand-int 10)))
          (apply str)))

(defn name-taken?
  "Returns true if name is already present in the set of reserved-names."
  [n] (contains? @active-robots n))

(defn assign-name
  "Assign unique name to robot."
  [r] (let [name (gen-name)]
        (if (name-taken? name) (recur r)
            (do (swap! active-robots conj name)
                (reset! r name)))))

(defn robot 
  "Create a new robot."
  [] (atom nil))

(defn robot-name
  "Either return aleady assigned name or
  assign new name if robot is unnamed."
  [r] (or @r (assign-name r)))

(defn reset-name 
  "Reset name of provided robot."
  [r] (do (swap! active-robots disj @r)
          (assign-name r)))
