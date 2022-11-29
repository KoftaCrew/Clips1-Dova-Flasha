(
    deftemplate square 
    (slot id) 
    (slot side-length)
)


(
    deftemplate rectangle 
    (slot id) 
    (slot width) 
    (slot length)
)


(
    deftemplate circle 
    (slot id) 
    (slot radius)
)

(
    defrule square-area
    (square (id ?id) (side-length ?s))
    =>
    (assert(area (* ?s ?s)))
)

(
    defrule circle-area
    (circle (id ?id) (radius ?r))
    =>
    (assert(area (* 3.14 (* ?r ?r))))
)

(
    defrule rectangle-area
    (rectangle (id ?id) (width ?w) (length ?l))
    =>
    (assert(area (* ?w ?l)))
)

(defglobal ?*sum-area* = 0)

(
    defrule a-sum
    (area ?x)
    =>
    (bind ?*sum-area* (+ ?*sum-area* ?x))
)



(
    defrule square-perimeter
    (square (id ?id) (side-length ?s))
    =>
    (assert(perimeter (* 4 ?s)))
)

(
    defrule circle-perimeter
    (circle (id ?id) (radius ?r))
    =>
    (assert(perimeter (* 3.14 (* 2 ?r))))
)

(
    defrule rectangle-perimeter
    (rectangle (id ?id) (width ?w) (length ?l))
    =>
    (assert(perimeter (* (+ ?w ?l) 2)))
)

(defglobal ?*sum-perimeter* = 0)

(
    defrule p-sum
    (perimeter ?x)
    =>
    (bind ?*sum-perimeter* (+ ?*sum-perimeter* ?x))
)



(
    deffacts test-case
    (square (id A) (side-length 3))
    (square (id B) (side-length 5))
    (rectangle (id C) (width 2) (length 5))
    (circle (id D) (radius 2))
    (circle (id E) (radius 6))
)
