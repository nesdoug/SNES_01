;macros for SNES


;mesen-s can use wdm is as a breakpoint
;for debugging purposes
.macro WDM_BREAK number
	.byte $42, number
.endmacro



.macro A8
	sep #$20
.endmacro

.macro A16
	rep #$20
.endmacro

.macro AXY8
	sep #$30
.endmacro

.macro AXY16
	rep #$30
.endmacro

.macro XY8
	sep #$10
.endmacro

.macro XY16
	rep #$10
.endmacro






