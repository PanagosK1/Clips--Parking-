(deffacts spaces
	(sp S01 0 P)
	(sp S02 0 free)
	(sp S03 0 P)
	(sp S04 0 P)
	(sp S05 0 P)
	(sp S06 0 P)
)

(deffacts platforms
	(pl P1 S01 free)
	(pl P2 S03 free)
	(pl P3 S04 free)
	(pl P4 S05 free)
	(pl P5 S06 free)
)

(deffacts left
	(le S02 S01)
	(le S03 S02)
	(le S05 S04)
	(le S06 S05)	
)


(deffacts up
	(up S04 S01)
	(up S05 S02)
	(up S06 S03)	
)

(deffacts cars
	(car YXF852 W)
)
