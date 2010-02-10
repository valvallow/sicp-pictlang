(load "./sicp-pictlang.scm")

;;; main

; painters
(wave-painter square-frame)
(wave2-painter square-frame)
(wave4-painter square-frame)
(wave-smile-painter square-frame)
(outline-painter square-frame)
(X-painter square-frame)
(diamond-painter square-frame)
(triangle-painter square-frame)
(hexagon-painter square-frame)
(cross-painter square-frame)
(lambda-painter square-frame)
(Z-painter square-frame)

; frames

(define p wave-painter)

(define owp
  (superpose p outline-painter))

(owp square-frame)
(owp parallelogram-frame)
(owp left-vert-rect-frame)
(owp bottom-horiz-rect-frame)
(owp half-square-frame)
(owp parallelogram-narrow-frame)

(define f square-frame)

((identity p) f)
((rotate90 p) f)
((rotate180 p) f)
((rotate270 p) f)
((beside p p) f)
((below p p) f)
((right-split p 2) f)
((up-split p 2) f)
((corner-split p 2) f)
((flip-vert p) f)
((flip-horiz p) f)
((flipped-pairs p) f)
((left-half p) f)
((right-half p) f)
((top-half p) f)
((bottom-half p) f)
((square-limit p 2) f)
((shrink-to-upper-right p) f)
((squash-inwards p) f)
((cross-limit p 2) f)
((cross-corner-limit p 2) f)
((grid-limit p 2) f)
((triple p p p) f)
((dog-ear p) f)

; samples

; sample-001
((square-limit
  (let ((friend (beside wave-painter (flip-horiz wave-painter))))
    (below friend (flip-vert friend))) 3) square-frame)

; sample-002
((corner-split hexagon-painter 5) square-frame)

; sample-003
((square-limit diamond-painter 4) square-frame)
; sample-004
((square-limit (superpose X-painter diamond-painter) 3) square-frame)
; sample-005
((square-limit (superpose X-painter cross-painter diamond-painter) 3) square-frame)

; sample-006
((square-limit (below (flip-vert (corner-split outline-painter 2))
        (right-split outline-painter 2)) 3) square-frame)

; sample-007
((cross-limit (right-split X-painter 2) 4) square-frame)

; sample-008
((let ((up (up-split (superpose X-painter cross-painter outline-painter) 2)))
   (cross-limit (below up (flip-vert up))  4)) square-frame)

; sample-009
((grid-limit wave-painter 4) square-frame)

; sample-010
(((coupling below) wave-painter 4) square-frame)

; sample-011
((cross-corner-limit wave-painter 4) square-frame)

; sample-012
((triple X-painter lambda-painter Z-painter) square-frame)

; sample-013
((square-limit (dog-ear outline-painter) 2) square-frame)

; sample-014
((square-limit (dog-ear wave-painter) 2) square-frame)

; sample-015
(let ((p (let ((p1 ((coupling below) wave-painter 4)))
           (let ((p2 (flip-horiz p1)))
             (beside p1 p2)))))
  ((below p (flip-vert p)) square-frame))

(let ((base ((coupling below) wave-painter 4)))
  (let ((vert (below (flip-vert (flip-horiz base)) base)))
    (let ((right (right-split vert 2)))
      ((beside vert right) square-frame))))

((square-limit (rotate270 (dog-ear outline-painter)) 2) square-frame)

((square-limit (dog-ear X-painter) 2) square-frame)