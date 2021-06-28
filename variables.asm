; variables declared

.segment "ZEROPAGE"

in_nmi: .res 2

.segment "BSS"

PAL_BUFFER: .res 512 ;palette

OAM_BUFFER: .res 512 ;low table
OAM_BUFFER2: .res 32 ;high table

