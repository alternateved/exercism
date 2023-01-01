(ns etl
  (:require [clojure.string :as str]))

(defn transform
  [m]
  (into {}
        (mapcat (fn [[k v]]
                     (map (fn [e] {(str/lower-case e) k}) v)) m)))
