 
!(bind! &nodes (new-space))

(= (parseChild $child $level $nchild)(
    case $child (
        (
            ($op $a $b) (Tree ($level $nchild) $op False)
        )
        ($symbol (Tree ($level $nchild) $symbol True ))
    )
))

(= (buildTree $exp $lvl $nchild ) 
    (
        case $exp (
            (
                (AND $a $b) (
                    let* (
                        ($left (parseChild $a (+ $lvl 1) 1))
                        ($right (parseChild $b (+ $lvl 1) 2))
                        (() (add-atom &nodes (Tree ($lvl $nchild) AND False $left))) 
                        (() (add-atom &nodes (Tree ($lvl $nchild) AND False $right)))
                    )
                       (
                        superpose((buildTree $a (+ $lvl 1) 1) (buildTree $b (+ $lvl 1) 2))
                    )
                    
                )
            )

            (
                (OR $a $b) (
                    let* (
                        ($left (parseChild $a (+ $lvl 1) 1))
                        ($right (parseChild $b (+ $lvl 1) 2))
                        (() (add-atom &nodes (Tree ($lvl $nchild) OR False $left))) 
                        (() (add-atom &nodes (Tree ($lvl $nchild) OR False $right)))
                        
                    )
                    (
                        superpose((buildTree $a (+ $lvl 1) 1) (buildTree $b (+ $lvl 1) 2))
                    )
                )
            )
            ($symbol Nil)            
        )
    ) )

    ; Testcase
; !(buildTree (AND A (OR A B)) 1 1)
; !(get-atoms &nodes)
