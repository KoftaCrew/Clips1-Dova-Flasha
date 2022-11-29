(defclass Shape
    (is-a USER)
    (role abstract)
    (slot ID (type SYMBOL))
    (slot color (allowed-values red blue green yellow))
)

(defclass Square
    (is-a Shape)
    (role concrete)
    (slot length (create-accessor read-write) )
)

(defmessage-handler Square
    calcArea ()
    (printout t (* (send ?self get-length) (send ?self get-length) ) crlf )
)

(defmessage-handler Square
    calcPerm ()
    (printout t (* (send ?self get-length) 4) crlf )
)

(defclass Rectangle
    (is-a Shape)
    (role concrete)
    (slot length (create-accessor read-write) )
    (slot width (create-accessor read-write) )
)

(defmessage-handler Rectangle
    calcArea ()
    (printout t (* (send ?self get-length) (send ?self get-width) ) crlf )
)

(defmessage-handler Rectangle
    calcPerm ()
    (printout t (* 2 (+ (send ?self get-length) (send ?self get-width))) crlf )
)

(definstances shapes
    (s1 of Square (ID A)(color blue) (length 3))
    (r1 of Rectangle (ID C) (width 2) (length 5))
)
