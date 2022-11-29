(
    deftemplate person
        (multislot full-name)
        (multislot children)
)

(
    deftemplate child-name
    (slot name)
)

(
    defrule more-than-three
    (person (full-name $?n) (children ?x ?y ?z $?rest))
    => 
    (printout t ?n)
    (printout t " has more than 3 children" crlf)
)

(
    defrule find-parent
    ?f <- (child-name (name ?x))
    (or
        (person (full-name $?name) (children $?z ?x $?y)) 

        (person (full-name $?name) (children ?x $?y)) 

        (person (full-name $?name) (children $?y ?x))
    )
    =>
    (printout t "The parent of ")
    (printout t ?x)
    (printout t " is ")
    (printout t ?name crlf)
    (retract ?f)
)

(
    deffacts test-case
    (person (full-name Mohamed Ashraf Mohamed) (children John Zeko David Ashraf))
    (person (full-name Hussein Zaky) (children Mahy Mona))
    (child-name (name John))
    (child-name (name Mahy))
)