(deffacts family
    (father Ahmed Mohammed)
    (mother Mona Ahmed)
    (father Ali Sara)
    (father Hassan Ahmed)
)

(defrule parent
    (or (father ?x ?y) (mother ?x ?y))
    => (assert (parent ?x ?y))
)
(defrule grandfather
    (father ?x ?y)
    (or (father ?y ?z) (mother ?y ?z))
    => (assert (grandFather ?x ?z))
)

(defrule grandmother
    (mother ?x ?y)
    (or (father ?y ?z) (mother ?y ?z))
    => (assert (grandMother ?x ?z))
)