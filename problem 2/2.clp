(defrule get-color
    =>(print "what color do you want?")
    (bind ?c (read))
    (assert (color ?c))
)

(defrule Egypt
    (or
        (color red $?x)
        (color white $?x)
        (color black $?x)
    )
    => (print "Egypt has the queried color(s)" crlf )
)

(defrule united-states
    (or
        (color red $?x)
        (color blue $?x)
        (color white $?x)
    )
    => (print "United States has the queried color(s)" crlf )
)


(defrule Belgium
    (or
        (color red $?x)
        (color black $?x)
        (color yellow $?x)
    )
    => (print "Belgium has the queried color(s)" crlf )
)

(defrule Sweden
    (or
        (color blue $?x)
        (color yellow $?x)
    )
    => (print "Sweden has the queried color(s)" crlf )
)

(defrule italy
    (or
        (color red $?x)
        (color white $?x)
        (color green $?x)
    )
    => (print "Italy has the queried color(s)" crlf )
)

(defrule Ireland
    (or
        (color green $?x)
        (color white $?x)
        (color orange $?x)
    )
    => (print "Ireland has the queried color(s)" crlf )
)

(defrule Greece
    (or
        (color blue $?x)
        (color white $?x)
    )
    => (print "Greece has the queried color(s)" crlf )
)