(answer-output)

(defn get-threes-and-fives []
  (reduce +
    (filter (fn [x]
      (or (= (mod x 5) 0) (= (mod x 3) 0)))
      (range 1000))))

(defn answer-output []
  (println (get-threes-and-fives)))

