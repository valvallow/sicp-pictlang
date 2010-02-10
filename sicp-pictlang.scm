;;; sicp - picture language

;;; drawers

(define y-rate 836)
(define x-rate 593)

(define draw-line
  (lambda (p0 p1)
    (for-each
     (lambda (x)
       (display " ")
       (display x))
     (list (* (xcor-vect p0) x-rate)
           (* (ycor-vect p0) y-rate)
           'moveto 
           (* (xcor-vect p1) x-rate)
           (* (ycor-vect p1) y-rate)
           'lineto
           'stroke))
    (newline)))

;;; vectors

(define make-vect cons)

(define xcor-vect car)

(define ycor-vect cdr)

(define make-vect-calc
  (lambda (operator)
    (lambda (v1 v2)
      (make-vect
       (operator (xcor-vect v1)
                 (xcor-vect v2))
       (operator (ycor-vect v1)
                 (ycor-vect v2))))))

(define add-vect
  (lambda (v1 v2)
    ((make-vect-calc +) v1 v2)))

(define sub-vect
  (lambda (v1 v2)
    ((make-vect-calc -) v1 v2)))

(define scale-vect
  (lambda (s v)
    ((make-vect-calc *) v (make-vect s s))))

;;; segments

(define make-segment cons)

(define start-segment car)

(define end-segment cdr)

; segments‚ÌÀ•W‚ğframe‚É‘Î‚·‚é‘Š‘Î’l‚É•ÏŠ·
(define segments->painter
  (lambda (segment-list)
    (lambda (frame)
      (for-each
       (lambda (segment)
         (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
       segment-list))))

(define append-segments
  (lambda segments
    (apply append segments)))

(define cross-segments
  (list (make-segment (make-vect 0.5 0)
                      (make-vect 0.5 1))
        (make-segment (make-vect 0 0.5)
                      (make-vect 1 0.5))))

(define X-segments
  (list (make-segment (make-vect 0 0)
                      (make-vect 1 1))
        (make-segment (make-vect 0 1)
                      (make-vect 1 0))))

(define triangle-segments
  (list (make-segment (make-vect 0 0)
                      (make-vect 0.5 1))
        (make-segment (make-vect 0.5 1)
                      (make-vect 1 0))
        (make-segment (make-vect 1 0)
                      (make-vect 0 0))))

(define outline-segments
  (list (make-segment (make-vect 0 0)
                      (make-vect 1 0))
        (make-segment (make-vect 1 0)
                      (make-vect 1 1))
        (make-segment (make-vect 1 1)
                      (make-vect 0 1))
        (make-segment (make-vect 0 1)
                      (make-vect 0 0))))

(define diamond-segments
  (list (make-segment (make-vect 0.5 0)
                      (make-vect 1 0.5))
        (make-segment (make-vect 1 0.5)
                      (make-vect 0.5 1))
        (make-segment (make-vect 0.5 1)
                      (make-vect 0 0.5))
        (make-segment (make-vect 0 0.5)
                      (make-vect 0.5 0))))

(define wave-segments
  (list (make-segment (make-vect 0.000 0.645)
                      (make-vect 0.154 0.411))
        (make-segment (make-vect 0.154 0.411)
                      (make-vect 0.302 0.588))
        (make-segment (make-vect 0.302 0.588)
                      (make-vect 0.354 0.497))
        (make-segment (make-vect 0.354 0.497)
                      (make-vect 0.245 0.000))
        (make-segment (make-vect 0.419 0.000)
                      (make-vect 0.497 0.171))
        (make-segment (make-vect 0.497 0.171)
                      (make-vect 0.575 0.000))
        (make-segment (make-vect 0.748 0.000)
                      (make-vect 0.605 0.462))
        (make-segment (make-vect 0.605 0.462)
                      (make-vect 1.000 0.142))
        (make-segment (make-vect 1.000 0.354)
                      (make-vect 0.748 0.657))
        (make-segment (make-vect 0.748 0.657)
                      (make-vect 0.582 0.657))
        (make-segment (make-vect 0.582 0.657)
                      (make-vect 0.640 0.857))
        (make-segment (make-vect 0.640 0.857)
                      (make-vect 0.575 1.000))
        (make-segment (make-vect 0.419 1.000)
                      (make-vect 0.354 0.857))
        (make-segment (make-vect 0.354 0.857)
                      (make-vect 0.411 0.657))
        (make-segment (make-vect 0.411 0.657)
                      (make-vect 0.285 0.657))
        (make-segment (make-vect 0.285 0.657)
                      (make-vect 0.154 0.605))
        (make-segment (make-vect 0.154 0.605)
                      (make-vect 0.000 0.857))))

(define wave-smile-segments
  (append-segments
   wave-segments
   (list (make-segment (make-vect 0.428 0.828)
                       (make-vect 0.451 0.840))
         (make-segment (make-vect 0.451 0.840)
                       (make-vect 0.471 0.828))
         (make-segment (make-vect 0.528 0.840)
                       (make-vect 0.551 0.828))
         (make-segment (make-vect 0.551 0.828)
                       (make-vect 0.578 0.840))
         (make-segment (make-vect 0.4 0.8)
                       (make-vect 0.6 0.8))
         (make-segment (make-vect 0.4 0.8)
                       (make-vect 0.5 0.77))
         (make-segment (make-vect 0.5 0.77)
                       (make-vect 0.6 0.8)))))

(define hexagon-segments
  (list (make-segment (make-vect 0.25 0)
                      (make-vect 0.75 0))
        (make-segment (make-vect 0.75 0)
                      (make-vect 1 0.25))
        (make-segment (make-vect 1 0.25)
                      (make-vect 1 0.75))
        (make-segment (make-vect 1 0.75)
                      (make-vect 0.75 1))
        (make-segment (make-vect 0.75 1)
                      (make-vect 0.25 1))
        (make-segment (make-vect 0.25 1)
                      (make-vect 0 0.75))
        (make-segment (make-vect 0 0.75)
                      (make-vect 0 0.25))
        (make-segment (make-vect 0 0.25)
                      (make-vect 0.25 0))))

(define lambda-segments
  (list (make-segment (make-vect 0.0 1.0)
                      (make-vect 1.0 0.0))
        (make-segment (make-vect 0.5 0.5)
                      (make-vect 0.0 0.0))))

(define Z-segments
     (list (make-segment (make-vect 0.0 0.9)
                         (make-vect 0.8 1.0))
           (make-segment (make-vect 0.8 1.0)
                         (make-vect 0.0 0.2))
           (make-segment (make-vect 0.0 0.2)
                         (make-vect 1.0 0.3))
           (make-segment (make-vect 0.25 0.68)
                         (make-vect 0.56 0.54))))

;;; frames

(define make-frame
  (lambda (origin edge1 edge2)
    (list origin edge1 edge2)))

(define origin-frame car)

(define edge1-frame cadr)

(define edge2-frame caddr)

; origin(frame) + x * edge1(frame) + y * edge2(frame)
(define frame-coord-map
  (lambda (frame)
    (lambda (v)
      (add-vect
       (origin-frame frame)
       (add-vect (scale-vect (xcor-vect v)
                             (edge1-frame frame))
                 (scale-vect (ycor-vect v)
                             (edge2-frame frame)))))))

(define square-frame
  (make-frame (make-vect 0.0 0.0)
              (make-vect 1.0 0.0)
              (make-vect 0.0 1.0)))

(define parallelogram-frame
  (make-frame (make-vect 0.0 0.0)
              (make-vect 0.5 0.0)
              (make-vect 0.5 1)))

(define left-vert-rect-frame
  (make-frame (make-vect 0.0 0.0)
              (make-vect 0.5 0.0)
              (make-vect 0 1)))

(define bottom-horiz-rect-frame
  (make-frame (make-vect 0.0 0.0)
              (make-vect 1.0 0.0)
              (make-vect 0.0 0.5)))

(define half-square-frame
  (make-frame (make-vect 0.25 0.25)
              (make-vect 0.5 0.0)
              (make-vect 0.0 0.5)))

(define parallelogram-narrow-frame
  (make-frame (make-vect 0.0 0.0)
              (make-vect 0.75 0.5)
              (make-vect 0.5 0.75)))

;;; operators

(define identity
  (lambda (painter)
    painter))

(define compose
  (lambda (f)
    (lambda (g)
      (lambda (x)
        (f (g x))))))

(define transform-painter
  (lambda (painter origin corner1 corner2)
    (lambda (frame)
      (let ((m (frame-coord-map frame)))
        (let ((new-origin (m origin)))
          (painter
           (make-frame new-origin
                       (sub-vect (m corner1) new-origin)
                       (sub-vect (m corner2) new-origin))))))))

; add
(define superpose
  (lambda painters
    (lambda (frame)
      (for-each (lambda (painter)
                  (painter frame))
                painters))))

; add
(define coupling
  (lambda (combinator)
    (lambda (painter1 n)
      ((repeated (lambda (painter2)
                   (combinator painter1 painter2)) n)
       painter1))))

; add
(define repeated
  (lambda (effecter n)
    (lambda (painter)
      (if (zero? n)
          painter
          ((repeated effecter (- n 1)) (effecter painter))))))

; add
(define quart
  (lambda (vert horiz)
    (lambda (painter)
      (((compose vert) horiz) painter))))

(define rotate90
  (lambda (painter)
    (transform-painter painter
                       (make-vect 1.0 0.0)
                       (make-vect 1.0 1.0)
                       (make-vect 0.0 0.0))))

;; (define rotate180
;;   (lambda (painter)
;;     (transform-painter painter
;;                        (make-vect 1.0 1.0)
;;                        (make-vect 0.0 1.0)
;;                        (make-vect 1.0 0.0))))
(define rotate180
  (lambda (painter)
    ((repeated rotate90 2) painter)))

;; (define rotate270
;;   (lambda (painter)
;;     (transform-painter painter
;;                        (make-vect 0.0 1.0)
;;                        (make-vect 0.0 0.0)
;;                        (make-vect 1.0 1.0))))
(define rotate270
  (lambda (painter)
    ((repeated rotate90 3) painter)))

(define flip-vert
  (lambda (painter)
    (transform-painter painter
                       (make-vect 0.0 1.0)
                       (make-vect 1.0 1.0)
                       (make-vect 0.0 0.0))))

(define flip-horiz
  (lambda (painter)
    (transform-painter painter
                       (make-vect 1.0 0.0)
                       (make-vect 0.0 0.0)
                       (make-vect 1.0 1.0))))

(define left-half
  (lambda (painter)
    (transform-painter painter
                       (make-vect 0.0 0.0)
                       (make-vect 0.5 0.0)
                       (make-vect 0.0 1.0))))

(define right-half
  (lambda (painter)
    (transform-painter painter
                       (make-vect 0.5 0.0)
                       (make-vect 1.0 0.0)
                       (make-vect 0.5 1.0))))

(define top-half
  (lambda (painter)
    (transform-painter painter
                       (make-vect 0.0 0.5)
                       (make-vect 1.0 0.5)
                       (make-vect 0.0 1.0))))
  
(define bottom-half
  (lambda (painter)
    (transform-painter painter
                       (make-vect 0.0 0.0)
                       (make-vect 1.0 0.0)
                       (make-vect 0.0 0.5))))

(define squash-left
  left-half)

;;   (lambda (painter)
;;     (transform-painter painter
;;                        (make-vect 0.0 0.0)
;;                        (make-vect 0.5 0.0)
;;                        (make-vect 0.0 1.0))))

;; (define beside
;;   (lambda (painter1 painter2)
;;     (let ((split-point (make-vect 0.5 0.0)))
;;       (let ((paint-left
;;              (transform-painter painter1
;;                                 (make-vect 0.0 0.0)
;;                                 split-point
;;                                 (make-vect 0.0 1.0)))
;;             (paint-right
;;              (transform-painter painter2
;;                                 split-point
;;                                 (make-vect 1.0 0.0)
;;                                 (make-vect 0.5 1.0))))
;;         (lambda (frame)
;;           (paint-left frame)
;;           (paint-right frame))))))
(define beside
  (lambda (painter1 painter2)
    (lambda (frame)
      ((superpose (left-half painter1)
                  (right-half painter2)) frame))))

;; (define below
;;   (lambda (painter1 painter2)
;;     (let ((split-point (make-vect 0.0 0.5)))
;;       (let ((paint-below
;;              (transform-painter painter1
;;                                 (make-vect 0.0 0.0)
;;                                 (make-vect 1.0 0.0)
;;                                 split-point))
;;             (paint-above
;;              (transform-painter painter2
;;                                 split-point
;;                                 (make-vect 1.0 0.5)
;;                                 (make-vect 0.0 1.0))))
;;         (lambda (frame)
;;           (paint-below frame)
;;           (paint-above frame))))))
(define below
  (lambda (painter1 painter2)
    (lambda (frame)
      ((superpose (bottom-half painter1)
                  (top-half painter2)) frame))))

(define split
  (lambda (operator1 operator2)
    (lambda (painter n)
      (if (zero? n)
          painter
          (let ((smaller ((split operator1 operator2) painter (- n 1))))
            (operator1 painter (operator2 smaller smaller)))))))

(define right-split
  (split beside below))

(define up-split
  (split below beside))

(define corner-split
  (lambda (painter n)
    (if (zero? n)
        painter
        (let ((up (up-split painter (- n 1)))
              (right (right-split painter (- n 1))))
          (let ((top-left (beside up up))
                (bottom-right (below right right))
                (corner (corner-split painter (- n 1))))
            (beside (below painter top-left)
                    (below bottom-right corner)))))))

(define square-of-four
  (lambda (tl tr bl br)
    (lambda (painter)
      (let ((top (beside (tl painter)
                         (tr painter)))
            (bottom (beside (bl painter)
                            (br painter))))
        (below bottom top)))))

(define square-limit
  (lambda (painter n)
    (let ((combine4 (square-of-four flip-horiz identity
                                    rotate180 flip-vert)))
      (combine4 (corner-split painter n)))))

(define cross-limit
  (lambda (painter n)
    (if (zero? n)
        painter
        (let ((cross (cross-limit painter (- n 1))))
          (let ((top (beside painter cross))
                (bottom (beside cross painter)))
            (below bottom top))))))

(define cross-corner-limit
  (coupling (lambda (painter1 painter2)
                  (below painter1 (beside painter1 painter2)))))

(define grid-limit
  (lambda (painter n)
    (if (zero? n)
        painter
        (grid-limit ((square-of-four identity identity
                                     identity identity) painter)
                    (- n 1)))))

(define triple
  (lambda (painter1 painter2 painter3)
    (below
     (beside painter2 painter3)
     (squash-left painter1))))

(define dog-ear
  (lambda (painter)
    ((coupling (lambda (painter1 painter2)
                     (triple painter2 painter1 painter2)))
     painter 3)))

(define flipped-pairs
  (lambda (painter)
    (let ((painter2 (beside painter (flip-vert painter))))
      (below painter2 painter2))))

;; (define shrink-to-upper-right
;;   (lambda (painter)
;;     (transform-painter painter
;;                        (make-vect 0.5 0.5)
;;                        (make-vect 1.0 0.5)
;;                        (make-vect 0.5 1.0))))
;; (define shrink-to-upper-right
;;   (lambda (painter)
;;     (((compose top-half) right-half) painter)))
(define shrink-to-upper-right
  (lambda (painter)
    (quarter top-half right-half)))
  
(define squash-inwards
  (lambda (painter)
    (transform-painter painter
                       (make-vect 0.0 0.0)
                       (make-vect 0.65 0.35)
                       (make-vect 0.35 0.65))))

;;; painters

(define wave-painter
  (segments->painter wave-segments))

(define wave2-painter
  (beside wave-painter (flip-vert wave-painter)))

(define wave4-painter
  (flipped-pairs wave-painter))

(define wave-smile-painter
  (segments->painter wave-smile-segments))

(define outline-painter
  (segments->painter outline-segments))

(define X-painter
  (segments->painter X-segments))

(define diamond-painter
  (segments->painter diamond-segments))

(define triangle-painter
  (segments->painter triangle-segments))

(define hexagon-painter
  (segments->painter hexagon-segments))

(define cross-painter
  (segments->painter cross-segments))

(define lambda-painter
  (segments->painter lambda-segments))

(define Z-painter
  (segments->painter Z-segments))
