(solve 101)

(defn square [x]
  (* x x))

(defn sum-squares [max]
  (reduce +
    (map (fn [x]
      (square x))
      (range max))))

(defn square-sum [max]
  (square
    (reduce +
      (range max))))


(defn solve [max]
  (println
    (- (square-sum max) (sum-squares max))))
