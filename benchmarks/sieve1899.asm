 
* = $1000
main:
; 
;line:8:sieve1899.mfk
;     LDA $14
    LDA $14
; 
;line:9:sieve1899.mfk
;     rt_check:
.ai__00031rt_check:
; 
;line:10:sieve1899.mfk
;     CMP $14
    CMP $14
; 
;line:11:sieve1899.mfk
;     BEQ rt_check
    BEQ .ai__00031rt_check
; 
;line:40:sieve1899.mfk
;     RTCLOK = 0
    LDA #0
    STA $13
    STA $14
; 
;line:42:sieve1899.mfk
;     for iter,9,downto,0 {
    LDA #$A
    STA main$iter
.do__00010:
    DEC main$iter
; 
;line:44:sieve1899.mfk
;       count = 0
    LDA #0
    STA $E6
    STA $E7
; 
;line:46:sieve1899.mfk
;       for i:flags {
    STA __reg
    LDA #hi(main$flags.array)
    STA __reg + 1
    LDA #1
    LDX #$20
.ms__00013:
    LDY #0
.ms__00015:
    STA (__reg), Y
    INY
    BNE .ms__00015
    INC __reg + 1
    DEX
    BNE .ms__00013
; 
;line:50:sieve1899.mfk
;       for i:flags {
    TXA
    STA $E0
    STA $E1
.do__00016:
; 
;line:51:sieve1899.mfk
;         if flags[i] == 1 {
    LDY $E0
    LDA $E1
    CLC
    ADC #hi(main$flags.array)
    STA __reg + 1
    LDA #0
    STA __reg
    LDA (__reg), Y
    CMP #1
    BNE .fi__00025
; 
;line:52:sieve1899.mfk
;           prime = (i * 2) + 3
    LDA $E0
    ASL
    STA __reg
    LDA $E1
    ROL
    TAX
    LDA __reg
    CLC
    ADC #3
    STA $E2
    TXA
    ADC #0
    STA $E3
; 
;line:53:sieve1899.mfk
;           k = i + prime
    LDA $E0
    CLC
    ADC $E2
    STA $E4
    LDA $E1
    ADC $E3
    STA $E5
; 
;line:54:sieve1899.mfk
;           while k <= size {
    JMP .he__00020
.wh__00019:
; 
;line:55:sieve1899.mfk
;             flags[k] = 0
    LDY $E4
    LDA $E5
    CLC
    ADC #hi(main$flags.array)
    STA __reg + 1
    LDA #0
    STA __reg
    STA (__reg), Y
; 
;line:56:sieve1899.mfk
;             k += prime
    LDA $E2
    CLC
    ADC $E4
    STA $E4
    LDA $E3
    ADC $E5
    STA $E5
; 
;line:54:sieve1899.mfk
;           while k <= size {
.he__00020:
    LDA #$20
    CMP $E5
    BCC .cp__00023
    BNE .wh__00019
    LDA $E4
    BEQ .wh__00019
.cp__00023:
; 
;line:58:sieve1899.mfk
;           count += 1
    INC $E6
    BNE .in__00024
    INC $E7
.in__00024:
; 
;line:51:sieve1899.mfk
;         if flags[i] == 1 {
.fi__00025:
; 
;line:50:sieve1899.mfk
;       for i:flags {
    INC $E0
    BNE .in__00026
    INC $E1
.in__00026:
    LDA $E0
    BNE .do__00016
    LDA $E1
    CMP #$20
    BNE .do__00016
; 
;line:42:sieve1899.mfk
;     for iter,9,downto,0 {
    LDA main$iter
; 
;line
    BEQ .lj80000
; 
;line:42:sieve1899.mfk
;     for iter,9,downto,0 {
    JMP .do__00010
; 
;line
.lj80000:
; 
;line:64:sieve1899.mfk
;     printScore()
    JSR printScore
; 
;line:66:sieve1899.mfk
;     while true {}
.wh__00027:
    JMP .wh__00027
; 
;line
 
* = $10b6
printScore:
; 
;line:19:sieve1899.mfk
;     screen = SAVMSC
    LDA $59
    STA $E9
    LDA $58
    STA $E8
; 
;line:21:sieve1899.mfk
;     tmp[0] = RTCLOK.lo >> 4
    LDA $13
    LSR
    LSR
    LSR
    LSR
    STA printScore$tmp.array
; 
;line:22:sieve1899.mfk
;     tmp[1] = RTCLOK.lo & %00001111
    LDA $13
    AND #$F
    STA printScore$tmp.array + 1
; 
;line:23:sieve1899.mfk
;     tmp[2] = RTCLOK.hi >> 4
    LDA $14
    LSR
    LSR
    LSR
    LSR
    STA printScore$tmp.array + 2
; 
;line:24:sieve1899.mfk
;     tmp[3] = RTCLOK.hi & %00001111
    LDA $14
    AND #$F
    STA printScore$tmp.array + 3
; 
;line:26:sieve1899.mfk
;     for iter:tmp {
    LDY #0
.do__00005:
; 
;line:27:sieve1899.mfk
;       if tmp[iter] < 10 {
    LDA printScore$tmp.array, Y
    CMP #$A
    BCS .el__00008
; 
;line:28:sieve1899.mfk
;         screen[iter] = tmp[iter] + $10
    LDA printScore$tmp.array, Y
    ADC #$10
; 
;line:27:sieve1899.mfk
;       if tmp[iter] < 10 {
    JMP .fi__00009
.el__00008:
; 
;line:30:sieve1899.mfk
;         screen[iter] = tmp[iter] + $17
    LDA printScore$tmp.array, Y
    CLC
    ADC #$17
; 
;line:27:sieve1899.mfk
;       if tmp[iter] < 10 {
.fi__00009:
; 
;line:28:sieve1899.mfk
;         screen[iter] = tmp[iter] + $10
    STA ($E8), Y
; 
;line:26:sieve1899.mfk
;     for iter:tmp {
    INY
    CPY #4
    BNE .do__00005
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
; 
;line
.ai__00031rt_check             = $1002
.cp__00023                     = $1093
.do__00005                     = $10DC
.do__00010                     = $1010
.do__00016                     = $1033
.el__00008                     = $10EB
.fi__00009                     = $10F1
.fi__00025                     = $1099
.he__00020                     = $1087
.in__00024                     = $1099
.in__00026                     = $109F
.lj80000                       = $10B0
.ms__00013                     = $1022
.ms__00015                     = $1024
.wh__00019                     = $106B
.wh__00027                     = $10B3
RTCLOK                         = $0013
RTCLOK.hi                      = $0014
RTCLOK.lo                      = $0013
SAVMSC                         = $0058
SAVMSC.hi                      = $0059
SAVMSC.lo                      = $0058
__heap_start                   = $3400
__reg                          = $0080
__rwdata_end                   = $0000
__rwdata_start                 = $0000
__zeropage_end                 = $00EA
__zeropage_first               = $0080
__zeropage_last                = $00E9
__zeropage_usage               = $006A
count                          = $00E6
count.hi                       = $00E7
count.lo                       = $00E6
i                              = $00E0
i.hi                           = $00E1
i.lo                           = $00E0
k                              = $00E4
k.hi                           = $00E5
k.lo                           = $00E4
main                           = $1000
main$flags.array               = $1400
main$iter                      = $0084
prime                          = $00E2
prime.hi                       = $00E3
prime.lo                       = $00E2
printScore                     = $10B6
printScore$iter                = $0085
printScore$tmp.array           = $0086
screen                         = $00E8
screen.hi                      = $00E9
screen.lo                      = $00E8
segment.default.bank           = $0000
segment.default.end            = $9FFF
segment.default.heapstart      = $3400
segment.default.length         = $8F07
segment.default.start          = $10F9
    ; $0000 = __rwdata_end
    ; $0000 = __rwdata_start
    ; $0000 = segment.default.bank
    ; $0013 = RTCLOK
    ; $0013 = RTCLOK.lo
    ; $0014 = RTCLOK.hi
    ; $0058 = SAVMSC
    ; $0058 = SAVMSC.lo
    ; $0059 = SAVMSC.hi
    ; $006A = __zeropage_usage
    ; $0080 = __reg
    ; $0080 = __zeropage_first
    ; $0084 = main$iter
    ; $0085 = printScore$iter
    ; $0086 = printScore$tmp.array
    ; $00E0 = i
    ; $00E0 = i.lo
    ; $00E1 = i.hi
    ; $00E2 = prime
    ; $00E2 = prime.lo
    ; $00E3 = prime.hi
    ; $00E4 = k
    ; $00E4 = k.lo
    ; $00E5 = k.hi
    ; $00E6 = count
    ; $00E6 = count.lo
    ; $00E7 = count.hi
    ; $00E8 = screen
    ; $00E8 = screen.lo
    ; $00E9 = __zeropage_last
    ; $00E9 = screen.hi
    ; $00EA = __zeropage_end
    ; $1000 = main
    ; $1002 = .ai__00031rt_check
    ; $1010 = .do__00010
    ; $1022 = .ms__00013
    ; $1024 = .ms__00015
    ; $1033 = .do__00016
    ; $106B = .wh__00019
    ; $1087 = .he__00020
    ; $1093 = .cp__00023
    ; $1099 = .fi__00025
    ; $1099 = .in__00024
    ; $109F = .in__00026
    ; $10B0 = .lj80000
    ; $10B3 = .wh__00027
    ; $10B6 = printScore
    ; $10DC = .do__00005
    ; $10EB = .el__00008
    ; $10F1 = .fi__00009
    ; $10F9 = segment.default.start
    ; $1400 = main$flags.array
    ; $3400 = __heap_start
    ; $3400 = segment.default.heapstart
    ; $8F07 = segment.default.length
    ; $9FFF = segment.default.end