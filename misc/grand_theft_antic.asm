 
* = $2000
main:
; 
;line:55:grand_theft_antic.mfk
;     for i:scores {
    LDA #0
    STA $B0
.do__00015:
; 
;line:56:grand_theft_antic.mfk
;       scores[i] = 0
    LDA $B0
    ASL
    TAY
    LDA #0
    STA $80, Y
    INY
    STA $80, Y
; 
;line:55:grand_theft_antic.mfk
;     for i:scores {
    INC $B0
    LDA $B0
    CMP #$11
    BNE .do__00015
; 
;line:59:grand_theft_antic.mfk
;     for i,0,to,15 {
    LDA #0
    STA $B0
.wh__00018:
; 
;line:60:grand_theft_antic.mfk
;       openmode(i)
    LDA $B0
    JSR $EF9C
; 
;line:8:grand_theft_antic.mfk
;     lda os_RTCLOK.b2
    LDA $14
; 
;line:9:grand_theft_antic.mfk
;     .rt_check:
.ai__00039pause$.rt_check:
; 
;line:10:grand_theft_antic.mfk
;     cmp os_RTCLOK.b2
    CMP $14
; 
;line:11:grand_theft_antic.mfk
;     beq .rt_check
    BEQ .ai__00039pause$.rt_check
; 
;line:62:grand_theft_antic.mfk
;       os_RTCLOK.b2 = 0
    LDA #0
    STA $14
; 
;line:63:grand_theft_antic.mfk
;       while os_RTCLOK.b2 < 100 {
    BEQ .he__00023
.wh__00022:
; 
;line:64:grand_theft_antic.mfk
;         scores[i] += 1
    LDA $B0
    ASL
    CLC
    ADC #$80
    STA __reg
    LDA #0
    TAX
    ROL
    STA __reg + 1
    LDA #1
    LDY #0
    ADC (__reg), Y
    STA (__reg), Y
    TXA
    INY
    ADC (__reg), Y
    STA (__reg), Y
; 
;line:63:grand_theft_antic.mfk
;       while os_RTCLOK.b2 < 100 {
.he__00023:
    LDA $14
    CMP #$64
    BCC .wh__00022
; 
;line:59:grand_theft_antic.mfk
;     for i,0,to,15 {
    LDA $B0
    CMP #$F
    BEQ .ew__00021
    INC $B0
    JMP .wh__00018
.ew__00021:
; 
;line:68:grand_theft_antic.mfk
;     os_SDMCTL = 0
    LDA #0
    STA $22F
; 
;line:69:grand_theft_antic.mfk
;     i = 16
    LDA #$10
    STA $B0
; 
;line:8:grand_theft_antic.mfk
;     lda os_RTCLOK.b2
    LDA $14
; 
;line:9:grand_theft_antic.mfk
;     .rt_check:
.ai__00040pause$.rt_check:
; 
;line:10:grand_theft_antic.mfk
;     cmp os_RTCLOK.b2
    CMP $14
; 
;line:11:grand_theft_antic.mfk
;     beq .rt_check
    BEQ .ai__00040pause$.rt_check
; 
;line:71:grand_theft_antic.mfk
;     os_RTCLOK.b2 = 0
    LDA #0
    STA $14
; 
;line:72:grand_theft_antic.mfk
;     while os_RTCLOK.b2 < 100 {
    BEQ .he__00029
.wh__00028:
; 
;line:73:grand_theft_antic.mfk
;       scores[i] += 1
    LDA $B0
    ASL
    CLC
    ADC #$80
    STA __reg
    LDA #0
    TAX
    ROL
    STA __reg + 1
    LDA #1
    LDY #0
    ADC (__reg), Y
    STA (__reg), Y
    TXA
    INY
    ADC (__reg), Y
    STA (__reg), Y
; 
;line:72:grand_theft_antic.mfk
;     while os_RTCLOK.b2 < 100 {
.he__00029:
    LDA $14
    CMP #$64
    BCC .wh__00028
; 
;line:75:grand_theft_antic.mfk
;     os_SDMCTL = $22
    LDA #$22
    STA $22F
; 
;line:77:grand_theft_antic.mfk
;     openmode(0)
    LDA #0
    JSR $EF9C
; 
;line:78:grand_theft_antic.mfk
;     screen = os_SAVMSC
    LDA $59
    STA $B3
    LDA $58
    STA $B2
; 
;line:80:grand_theft_antic.mfk
;     for i:scores {
    LDA #0
    STA $B0
.do__00032:
; 
;line:81:grand_theft_antic.mfk
;       printScore(scores[i])
    LDA $B0
    ASL
    TAY
    LDA $80, Y
    STA printScore$val
    LDA $81, Y
    STA printScore$val + 1
    JSR printScore
; 
;line:80:grand_theft_antic.mfk
;     for i:scores {
    INC $B0
    LDA $B0
    CMP #$11
    BNE .do__00032
; 
;line:84:grand_theft_antic.mfk
;     while true {}
.wh__00035:
    BEQ .wh__00035
; 
;line
 
* = $20c3
printScore:
; 
;line:20:grand_theft_antic.mfk
;     tmp[0] = val.hi >> 4
    LDA printScore$val + 1
    LSR
    LSR
    LSR
    LSR
    STA printScore$tmp.array
; 
;line:21:grand_theft_antic.mfk
;     tmp[1] = val.hi & %00001111
    LDA printScore$val + 1
    AND #$F
    STA printScore$tmp.array + 1
; 
;line:22:grand_theft_antic.mfk
;     tmp[2] = val.lo >> 4
    LDA printScore$val
    LSR
    LSR
    LSR
    LSR
    STA printScore$tmp.array + 2
; 
;line:23:grand_theft_antic.mfk
;     tmp[3] = val.lo & %00001111
    LDA printScore$val
    AND #$F
    STA printScore$tmp.array + 3
; 
;line:25:grand_theft_antic.mfk
;     for iter:tmp {
    LDY #0
.do__00005:
; 
;line:26:grand_theft_antic.mfk
;       if tmp[iter] < 10 {
    LDA printScore$tmp.array, Y
    CMP #$A
    BCS .el__00008
; 
;line:27:grand_theft_antic.mfk
;         screen[iter] = tmp[iter] + $10
    ADC #$10
; 
;line:26:grand_theft_antic.mfk
;       if tmp[iter] < 10 {
    JMP .fi__00009
.el__00008:
; 
;line:29:grand_theft_antic.mfk
;         screen[iter] = tmp[iter] + $17
    LDA printScore$tmp.array, Y
    CLC
    ADC #$17
; 
;line:26:grand_theft_antic.mfk
;       if tmp[iter] < 10 {
.fi__00009:
; 
;line:27:grand_theft_antic.mfk
;         screen[iter] = tmp[iter] + $10
    STA ($B2), Y
; 
;line:25:grand_theft_antic.mfk
;     for iter:tmp {
    INY
    CPY #4
    BNE .do__00005
; 
;line:33:grand_theft_antic.mfk
;     if i < 16 {
    LDA $B0
    CMP #$10
    BCS .el__00012
; 
;line:34:grand_theft_antic.mfk
;       screen[4] = 0
    LDA #0
    LDY #4
    STA ($B2), Y
; 
;line:35:grand_theft_antic.mfk
;       screen[5] = 'G' atariscr
    LDA #$27
    INY
    STA ($B2), Y
; 
;line:36:grand_theft_antic.mfk
;       screen[6] = 'R' atariscr
    LDA #$32
    INY
    STA ($B2), Y
; 
;line:37:grand_theft_antic.mfk
;       screen[7] = '.' atariscr
    LDA #$E
    INY
    STA ($B2), Y
; 
;line:38:grand_theft_antic.mfk
;       if i < 10 {
    LDA $B0
    CMP #$A
    BCS .el__00010
; 
;line:39:grand_theft_antic.mfk
;         screen[8] = i + $10
    ADC #$10
; 
;line:38:grand_theft_antic.mfk
;       if i < 10 {
    JMP .fi__00011
.el__00010:
; 
;line:41:grand_theft_antic.mfk
;         screen[8] = i + $17
    LDA $B0
    CLC
    ADC #$17
; 
;line:38:grand_theft_antic.mfk
;       if i < 10 {
.fi__00011:
; 
;line:39:grand_theft_antic.mfk
;         screen[8] = i + $10
    INY
    STA ($B2), Y
; 
;line:33:grand_theft_antic.mfk
;     if i < 16 {
    BNE .fi__00013
.el__00012:
; 
;line:44:grand_theft_antic.mfk
;       screen[4] = 0
    LDA #0
    LDY #4
    STA ($B2), Y
; 
;line:45:grand_theft_antic.mfk
;       screen[5] = 'O' atariscr
    LDA #$2F
    INY
    STA ($B2), Y
; 
;line:46:grand_theft_antic.mfk
;       screen[6] = 'F' atariscr
    LDA #$26
    INY
    STA ($B2), Y
; 
;line:47:grand_theft_antic.mfk
;       screen[7] = 'F' atariscr
    INY
    STA ($B2), Y
; 
;line:33:grand_theft_antic.mfk
;     if i < 16 {
.fi__00013:
; 
;line:50:grand_theft_antic.mfk
;     screen += 40
    CLC
    LDA $B2
    ADC #$28
    STA $B2
    BCC .ah__00014
    INC $B3
.ah__00014:
    ; DISCARD_AF
    ; DISCARD_XF
    ; DISCARD_YF
    RTS
; 
;line
.ah__00014                     = $2148
.ai__00039pause$.rt_check      = $2024
.ai__00040pause$.rt_check      = $2066
.do__00005                     = $20E1
.do__00015                     = $2004
.do__00032                     = $20A8
.el__00008                     = $20ED
.el__00010                     = $2120
.el__00012                     = $212A
.ew__00021                     = $205B
.fi__00009                     = $20F3
.fi__00011                     = $2125
.fi__00013                     = $213D
.he__00023                     = $204A
.he__00029                     = $208C
.wh__00018                     = $201D
.wh__00022                     = $202E
.wh__00028                     = $2070
.wh__00035                     = $20C1
__heap_start                   = $2000
__reg                          = $00A2
__rwdata_end                   = $0000
__rwdata_start                 = $0000
__zeropage_end                 = $00B4
__zeropage_first               = $0080
__zeropage_last                = $00B3
__zeropage_usage               = $0034
antic_chactl                   = $D401
antic_chbase                   = $D409
antic_dlist                    = $D402
antic_dlist.hi                 = $D403
antic_dlist.lo                 = $D402
antic_dlisth                   = $D403
antic_dlistl                   = $D402
antic_dmactl                   = $D400
antic_hscrol                   = $D404
antic_nmien                    = $D40E
antic_nmires                   = $D40F
antic_nmist                    = $D40F
antic_penh                     = $D40C
antic_penv                     = $D40D
antic_pmbase                   = $D407
antic_unuse0                   = $D406
antic_unuse1                   = $D408
antic_vcount                   = $D40B
antic_vscrol                   = $D405
antic_wsync                    = $D40A
gtia_colbk                     = $D01A
gtia_colpf0                    = $D016
gtia_colpf1                    = $D017
gtia_colpf2                    = $D018
gtia_colpf3                    = $D019
gtia_colpm0                    = $D012
gtia_colpm1                    = $D013
gtia_colpm2                    = $D014
gtia_colpm3                    = $D015
gtia_consol                    = $D01F
gtia_gractl                    = $D01D
gtia_grafm                     = $D011
gtia_grafp0                    = $D00D
gtia_grafp1                    = $D00E
gtia_grafp2                    = $D00F
gtia_grafp3                    = $D010
gtia_hitclr                    = $D01E
gtia_hposm0                    = $D004
gtia_hposm1                    = $D005
gtia_hposm2                    = $D006
gtia_hposm3                    = $D007
gtia_hposp0                    = $D000
gtia_hposp1                    = $D001
gtia_hposp2                    = $D002
gtia_hposp3                    = $D003
gtia_m0pf                      = $D000
gtia_m0pl                      = $D008
gtia_m1pf                      = $D001
gtia_m1pl                      = $D009
gtia_m2pf                      = $D002
gtia_m2pl                      = $D00A
gtia_m3pf                      = $D003
gtia_m3pl                      = $D00B
gtia_p0pf                      = $D004
gtia_p0pl                      = $D00C
gtia_p1pf                      = $D005
gtia_p1pl                      = $D00D
gtia_p2pf                      = $D006
gtia_p2pl                      = $D00E
gtia_p3pf                      = $D007
gtia_p3pl                      = $D00F
gtia_pal                       = $D014
gtia_prior                     = $D01B
gtia_sizem                     = $D00C
gtia_sizep0                    = $D008
gtia_sizep1                    = $D009
gtia_sizep2                    = $D00A
gtia_sizep3                    = $D00B
gtia_trig0                     = $D010
gtia_trig1                     = $D011
gtia_trig2                     = $D012
gtia_trig3                     = $D013
gtia_vdelay                    = $D01C
i                              = $00B0
irq_routine_addr               = $FFFE
irq_routine_addr.hi            = $FFFF
irq_routine_addr.lo            = $FFFE
main                           = $2000
nmi_routine_addr               = $FFFA
nmi_routine_addr.hi            = $FFFB
nmi_routine_addr.lo            = $FFFA
os_ABUFPT                      = $001C
os_ACMISR                      = $02D7
os_ACMISR.hi                   = $02D8
os_ACMISR.lo                   = $02D7
os_ACMVAR                      = $03ED
os_ADRESS                      = $0064
os_ADRESS.hi                   = $0065
os_ADRESS.lo                   = $0064
os_APPMHI                      = $000E
os_APPMHI.hi                   = $000F
os_APPMHI.lo                   = $000E
os_ATACHR                      = $02FB
os_ATRACT                      = $004D
os_BASICF                      = $03F8
os_BFENHI                      = $0035
os_BFENLO                      = $0034
os_BITMSK                      = $006E
os_BLIM                        = $028A
os_BOOTAD                      = $0242
os_BOOTAD.hi                   = $0243
os_BOOTAD.lo                   = $0242
os_BOOTQ                       = $0009
os_BOTSCR                      = $02BF
os_BPTR                        = $003D
os_BRKKEY                      = $0011
os_BRKKY                       = $0236
os_BRKKY.hi                    = $0237
os_BRKKY.lo                    = $0236
os_BUFADR                      = $0015
os_BUFADR.hi                   = $0016
os_BUFADR.lo                   = $0015
os_BUFCNT                      = $006B
os_BUFRFL                      = $0038
os_BUFRHI                      = $0033
os_BUFRLO                      = $0032
os_BUFSTR                      = $006C
os_BUFSTR.hi                   = $006D
os_BUFSTR.lo                   = $006C
os_CART                        = $BFFC
os_CARTAD                      = $BFFE
os_CARTAD.hi                   = $BFFF
os_CARTAD.lo                   = $BFFE
os_CARTCK                      = $03EB
os_CARTCS                      = $BFFA
os_CARTCS.hi                   = $BFFB
os_CARTCS.lo                   = $BFFA
os_CARTFG                      = $BFFD
os_CASBUF                      = $03FD
os_CASETV.array                = $E440
os_CASETV.first                = $E440
os_CASFLG                      = $030F
os_CASINI                      = $0002
os_CASINI.hi                   = $0003
os_CASINI.lo                   = $0002
os_CASSBT                      = $03EA
os_CAUX1                       = $023C
os_CAUX2                       = $023D
os_CBAUDH                      = $02EF
os_CBAUDL                      = $02EE
os_CCOMND                      = $023B
os_CDEVIC                      = $023A
os_CDTMA1                      = $0226
os_CDTMA1.hi                   = $0227
os_CDTMA1.lo                   = $0226
os_CDTMA2                      = $0228
os_CDTMA2.hi                   = $0229
os_CDTMA2.lo                   = $0228
os_CDTMF3                      = $022A
os_CDTMF4                      = $022C
os_CDTMF5                      = $022E
os_CDTMV1                      = $0218
os_CDTMV1.hi                   = $0219
os_CDTMV1.lo                   = $0218
os_CDTMV2                      = $021A
os_CDTMV2.hi                   = $021B
os_CDTMV2.lo                   = $021A
os_CDTMV3                      = $021C
os_CDTMV3.hi                   = $021D
os_CDTMV3.lo                   = $021C
os_CDTMV4                      = $021E
os_CDTMV4.hi                   = $021F
os_CDTMV4.lo                   = $021E
os_CDTMV5                      = $0220
os_CDTMV5.hi                   = $0221
os_CDTMV5.lo                   = $0220
os_CH                          = $02FC
os_CH1                         = $02F2
os_CHACT                       = $02F3
os_CHAR                        = $02FA
os_CHBAS                       = $02F4
os_CHKSNT                      = $003B
os_CHKSUM                      = $0031
os_CHLINK                      = $03FB
os_CHLINK.hi                   = $03FC
os_CHLINK.lo                   = $03FB
os_CHSALT                      = $026B
os_CIOCHR                      = $002F
os_CKEY                        = $03E9
os_CMCMD                       = $0007
os_COLAC                       = $0072
os_COLAC.hi                    = $0073
os_COLAC.lo                    = $0072
os_COLCRS                      = $0055
os_COLCRS.hi                   = $0056
os_COLCRS.lo                   = $0055
os_COLDST                      = $0244
os_COLINC                      = $02F9
os_COLOR0                      = $02C4
os_COLOR1                      = $02C5
os_COLOR2                      = $02C6
os_COLOR3                      = $02C7
os_COLOR4                      = $02C8
os_COLRSH                      = $004F
os_COUNTR                      = $007E
os_COUNTR.hi                   = $007F
os_COUNTR.lo                   = $007E
os_CRETRY                      = $029C
os_CRITIC                      = $0042
os_CRSINH                      = $02F0
os_DAUX1                       = $030A
os_DAUX2                       = $030B
os_DBSECT                      = $0241
os_DBUFHI                      = $0305
os_DBUFLO                      = $0304
os_DBYTHI                      = $0309
os_DBYTLO                      = $0308
os_DCB                         = $0300
os_DCOMND                      = $0302
os_DCSORG.array                = $E000
os_DCSORG.first                = $E000
os_DDEVIC                      = $0300
os_DELTAC                      = $0077
os_DELTAC.hi                   = $0078
os_DELTAC.lo                   = $0077
os_DELTAR                      = $0076
os_DERRF                       = $03EC
os_DFLAGS                      = $0240
os_DINDEX                      = $0057
os_DMASAV                      = $02DD
os_DMASK                       = $02A0
os_DOSINI                      = $000C
os_DOSINI.hi                   = $000D
os_DOSINI.lo                   = $000C
os_DOSVEC                      = $000A
os_DOSVEC.hi                   = $000B
os_DOSVEC.lo                   = $000A
os_DRETRY                      = $02BD
os_DRKMSK                      = $004E
os_DSCTLN                      = $02D5
os_DSCTLN.hi                   = $02D6
os_DSCTLN.lo                   = $02D5
os_DSKFMS                      = $0018
os_DSKFMS.hi                   = $0019
os_DSKFMS.lo                   = $0018
os_DSKTIM                      = $0246
os_DSKUTL                      = $001A
os_DSKUTL.hi                   = $001B
os_DSKUTL.lo                   = $001A
os_DSPFLG                      = $02FE
os_DSTAT                       = $004C
os_DSTATS                      = $0303
os_DTIMLO                      = $0306
os_DUNIT                       = $0301
os_DUNUSE                      = $0307
os_DVSTAT                      = $02EA
os_EDITRV.array                = $E400
os_EDITRV.first                = $E400
os_ENDPT                       = $0074
os_ENDPT.hi                    = $0075
os_ENDPT.lo                    = $0074
os_ERRFLG                      = $023F
os_ERRNO                       = $0049
os_ESCFLG                      = $02A2
os_FEOF                        = $003F
os_FILDAT                      = $02FD
os_FILFLG                      = $02B7
os_FINE                        = $026E
os_FKDEF                       = $0060
os_FKDEF.hi                    = $0061
os_FKDEF.lo                    = $0060
os_FMSZPG                      = $0043
os_FREQ                        = $0040
os_FRMADR                      = $0068
os_FRMADR.hi                   = $0069
os_FRMADR.lo                   = $0068
os_FTYPE                       = $003E
os_GBYTEA                      = $02CF
os_GBYTEA.hi                   = $02D0
os_GBYTEA.lo                   = $02CF
os_GINTLK                      = $03FA
os_GLBABS                      = $02E0
os_GPRIOR                      = $026F
os_HATABS                      = $031A
os_HELPFG                      = $02DC
os_HIBYTE                      = $0288
os_HIUSED                      = $02CB
os_HIUSED.hi                   = $02CC
os_HIUSED.lo                   = $02CB
os_HNDLOD                      = $02E9
os_HOLD1                       = $0051
os_HOLD2                       = $029F
os_HOLD3                       = $029D
os_HOLD4                       = $02BC
os_HOLDCH                      = $007C
os_ICAX1Z                      = $002A
os_ICAX2Z                      = $002B
os_ICBAHZ                      = $0025
os_ICBALZ                      = $0024
os_ICBLHZ                      = $0029
os_ICBLLZ                      = $0028
os_ICCOMT                      = $0017
os_ICCOMZ                      = $0022
os_ICDNOZ                      = $0021
os_ICHIDZ                      = $0020
os_ICIDNO                      = $002E
os_ICPTHZ                      = $0027
os_ICPTLZ                      = $0026
os_ICSORG.array                = $CC00
os_ICSORG.first                = $CC00
os_ICSPRZ                      = $002C
os_ICSTAZ                      = $0023
os_IMASK                       = $028B
os_INIML                       = $0700
os_INITAD                      = $02E2
os_INITAD.hi                   = $02E3
os_INITAD.lo                   = $02E2
os_INSDAT                      = $007D
os_INTABS                      = $0200
os_INTABS.hi                   = $0201
os_INTABS.lo                   = $0200
os_INTEMP                      = $022D
os_INTZBS                      = $0010
os_INVFLG                      = $02B6
os_IOCB0                       = $0340
os_IOCB1                       = $0350
os_IOCB2                       = $0360
os_IOCB3                       = $0370
os_IOCB4                       = $0380
os_IOCB5                       = $0390
os_IOCB6                       = $03A0
os_IOCB7                       = $03B0
os_IOCBAS                      = $0020
os_IRQVEC                      = $FFFE
os_IRQVEC.hi                   = $FFFF
os_IRQVEC.lo                   = $FFFE
os_JMPERS                      = $030E
os_JVECK                       = $028C
os_JVECK.hi                    = $028D
os_JVECK.lo                    = $028C
os_KEYBDV.array                = $E420
os_KEYBDV.first                = $E420
os_KEYDEF                      = $0079
os_KEYDEF.hi                   = $007A
os_KEYDEF.lo                   = $0079
os_KEYDEL                      = $02F1
os_KEYDIS                      = $026D
os_KEYREP                      = $02DA
os_KRPDEL                      = $02D9
os_LBPR1                       = $057E
os_LBPR2                       = $057F
os_LBUFF                       = $0580
os_LCOUNT                      = $0233
os_LINZBS                      = $0000
os_LMARGN                      = $0052
os_LNFLG                       = $0000
os_LOADAD                      = $02D1
os_LOADAD.hi                   = $02D2
os_LOADAD.lo                   = $02D1
os_LOGCOL                      = $0063
os_LOGMAP                      = $02B2
os_LPENH                       = $0234
os_LPENV                       = $0235
os_LTEMP                       = $0036
os_LTEMP.hi                    = $0037
os_LTEMP.lo                    = $0036
os_MEMLO                       = $02E7
os_MEMLO.hi                    = $02E8
os_MEMLO.lo                    = $02E7
os_MEMTOP                      = $02E5
os_MEMTOP.hi                   = $02E6
os_MEMTOP.lo                   = $02E5
os_MINTLK                      = $03F9
os_MLTTMP                      = $0066
os_NEWADR                      = $028E
os_NEWADR.hi                   = $028F
os_NEWADR.lo                   = $028E
os_NEWCOL                      = $02F6
os_NEWCOL.hi                   = $02F7
os_NEWCOL.lo                   = $02F6
os_NEWROW                      = $02F5
os_NGFLAG                      = $0001
os_NMIVEC                      = $FFFA
os_NMIVEC.hi                   = $FFFB
os_NMIVEC.lo                   = $FFFA
os_NOCKSM                      = $003C
os_NOCLIK                      = $02DB
os_OLDADR                      = $005E
os_OLDADR.hi                   = $005F
os_OLDADR.lo                   = $005E
os_OLDCHR                      = $005D
os_OLDCOL                      = $005B
os_OLDCOL.hi                   = $005C
os_OLDCOL.lo                   = $005B
os_OLDPAR                      = $02CF
os_OLDROW                      = $005A
os_OPNTMP                      = $0066
os_PADDL0                      = $0270
os_PADDL1                      = $0271
os_PADDL2                      = $0272
os_PADDL3                      = $0273
os_PADDL4                      = $0274
os_PADDL5                      = $0275
os_PADDL6                      = $0276
os_PADDL7                      = $0277
os_PALNTS                      = $0062
os_PARMBL                      = $02C9
os_PBPNT                       = $02DE
os_PBUFSZ                      = $02DF
os_PCOLR0                      = $02C0
os_PCOLR1                      = $02C1
os_PCOLR2                      = $02C2
os_PCOLR3                      = $02C3
os_PDIMSK                      = $0249
os_PDVMSK                      = $0247
os_POKMSK                      = $0010
os_PPTMPA                      = $024C
os_PPTMPX                      = $024D
os_PRINTV.array                = $E430
os_PRINTV.first                = $E430
os_PRNBUF                      = $03C0
os_PTIMOT                      = $0314
os_PTRIG0                      = $027C
os_PTRIG1                      = $027D
os_PTRIG2                      = $027E
os_PTRIG3                      = $027F
os_PTRIG4                      = $0280
os_PTRIG5                      = $0281
os_PTRIG6                      = $0281
os_PTRIG7                      = $0283
os_PUPBT1                      = $033D
os_PUPBT2                      = $033E
os_PUPBT3                      = $033F
os_RAMLO                       = $0004
os_RAMLO.hi                    = $0005
os_RAMLO.lo                    = $0004
os_RAMSIZ                      = $02E4
os_RAMTOP                      = $006A
os_RECLEN                      = $0245
os_RECVDN                      = $0039
os_RELADR                      = $024A
os_RELADR.hi                   = $024B
os_RELADR.lo                   = $024A
os_RESVEC                      = $FFFC
os_RESVEC.hi                   = $FFFD
os_RESVEC.lo                   = $FFFC
os_RMARGN                      = $0053
os_ROWAC                       = $0070
os_ROWAC.hi                    = $0071
os_ROWAC.lo                    = $0070
os_ROWCRS                      = $0054
os_ROWINC                      = $02F8
os_RTCLOK                      = $0012
os_RTCLOK.b0                   = $0012
os_RTCLOK.b1                   = $0013
os_RTCLOK.b2                   = $0014
os_RTCLOK.hiword               = $0013
os_RTCLOK.hiword.hi            = $0014
os_RTCLOK.hiword.lo            = $0013
os_RTCLOK.loword               = $0012
os_RTCLOK.loword.hi            = $0013
os_RTCLOK.loword.lo            = $0012
os_RUNAD                       = $02E0
os_RUNAD.hi                    = $02E1
os_RUNAD.lo                    = $02E0
os_RUNADR                      = $02C9
os_RUNADR.hi                   = $02CA
os_RUNADR.lo                   = $02C9
os_SAVADR                      = $0068
os_SAVADR.hi                   = $0069
os_SAVADR.lo                   = $0068
os_SAVIO                       = $0316
os_SAVMSC                      = $0058
os_SAVMSC.hi                   = $0059
os_SAVMSC.lo                   = $0058
os_SCRENV.array                = $E410
os_SCRENV.first                = $E410
os_SCRFLG                      = $02BB
os_SDLST                       = $0230
os_SDLST.hi                    = $0231
os_SDLST.lo                    = $0230
os_SDLSTH                      = $0231
os_SDLSTL                      = $0230
os_SDMCTL                      = $022F
os_SHFAMT                      = $006F
os_SHFLOK                      = $02BE
os_SHPDVS                      = $0248
os_SOUNDR                      = $0041
os_SRTIMR                      = $022B
os_SSFLAG                      = $02FF
os_SSKCTL                      = $0232
os_STACKP                      = $0318
os_STATUS                      = $0030
os_STICK0                      = $0278
os_STICK1                      = $0279
os_STICK2                      = $027A
os_STICK3                      = $027B
os_STRIG0                      = $0284
os_STRIG1                      = $0285
os_STRIG2                      = $0286
os_STRIG3                      = $0287
os_SUBTMP                      = $029E
os_SUPERF                      = $03E8
os_SWPFLG                      = $007B
os_TABMAP                      = $02A3
os_TEMP                        = $023E
os_TEMP1                       = $0312
os_TEMP1.hi                    = $0313
os_TEMP1.lo                    = $0312
os_TEMP2                       = $0313
os_TEMP3                       = $0315
os_TIMER1                      = $030C
os_TIMER1.hi                   = $030D
os_TIMER1.lo                   = $030C
os_TIMER2                      = $0310
os_TIMER2.hi                   = $0311
os_TIMER2.lo                   = $0310
os_TIMFLG                      = $0317
os_TINDEX                      = $0293
os_TMPCHR                      = $0050
os_TMPCOL                      = $02B9
os_TMPCOL.hi                   = $02BA
os_TMPCOL.lo                   = $02B9
os_TMPLBT                      = $02A1
os_TMPROW                      = $02B8
os_TOADR                       = $0066
os_TOADR.hi                    = $0067
os_TOADR.lo                    = $0066
os_TRAMSZ                      = $0006
os_TSTAT                       = $0319
os_TXTCOL                      = $0291
os_TXTCOL.hi                   = $0292
os_TXTCOL.lo                   = $0291
os_TXTMSC                      = $0294
os_TXTOLD                      = $0296
os_TXTROW                      = $0290
os_USAREA                      = $0480
os_VBREAK                      = $0206
os_VBREAK.hi                   = $0207
os_VBREAK.lo                   = $0206
os_VDSLST                      = $0200
os_VDSLST.hi                   = $0201
os_VDSLST.lo                   = $0200
os_VIMIRQ                      = $0216
os_VIMIRQ.hi                   = $0217
os_VIMIRQ.lo                   = $0216
os_VINTER                      = $0204
os_VINTER.hi                   = $0205
os_VINTER.lo                   = $0204
os_VKEYBD                      = $0208
os_VKEYBD.hi                   = $0209
os_VKEYBD.lo                   = $0208
os_VPIRQ                       = $0238
os_VPIRQ.hi                    = $0239
os_VPIRQ.lo                    = $0238
os_VPRCED                      = $0202
os_VPRCED.hi                   = $0203
os_VPRCED.lo                   = $0202
os_VSERIN                      = $020A
os_VSERIN.hi                   = $020B
os_VSERIN.lo                   = $020A
os_VSEROC                      = $020E
os_VSEROC.hi                   = $020F
os_VSEROC.lo                   = $020E
os_VSEROR                      = $020C
os_VSEROR.hi                   = $020D
os_VSEROR.lo                   = $020C
os_VSFLAG                      = $026C
os_VTIMR1                      = $0210
os_VTIMR1.hi                   = $0211
os_VTIMR1.lo                   = $0210
os_VTIMR2                      = $0212
os_VTIMR2.hi                   = $0213
os_VTIMR2.lo                   = $0212
os_VTIMR4                      = $0214
os_VTIMR4.hi                   = $0215
os_VTIMR4.lo                   = $0214
os_VVBLKD                      = $0224
os_VVBLKD.hi                   = $0225
os_VVBLKD.lo                   = $0224
os_VVBLKI                      = $0222
os_VVBLKI.hi                   = $0223
os_VVBLKI.lo                   = $0222
os_WARMST                      = $0008
os_WMODE                       = $0289
os_XMTDON                      = $003A
os_ZBUFP                       = $0043
os_ZBUFP.hi                    = $0044
os_ZBUFP.lo                    = $0043
os_ZCHAIN                      = $004A
os_ZCHAIN.hi                   = $004B
os_ZCHAIN.lo                   = $004A
os_ZDRVA                       = $0045
os_ZDRVA.hi                    = $0046
os_ZDRVA.lo                    = $0045
os_ZHIUSE                      = $02CD
os_ZHIUSE.hi                   = $02CE
os_ZHIUSE.lo                   = $02CD
os_ZIOCB                       = $0020
os_ZLOADA                      = $02D3
os_ZLOADA.hi                   = $02D4
os_ZLOADA.lo                   = $02D3
os_ZSBA                        = $0047
os_ZSBA.hi                     = $0048
os_ZSBA.lo                     = $0047
pia_pactl                      = $D302
pia_pbctl                      = $D303
pia_porta                      = $D300
pia_portb                      = $D301
pokey_allpot                   = $D208
pokey_audc1                    = $D201
pokey_audc2                    = $D203
pokey_audc3                    = $D205
pokey_audc4                    = $D207
pokey_audctl                   = $D208
pokey_audf1                    = $D200
pokey_audf2                    = $D202
pokey_audf3                    = $D204
pokey_audf4                    = $D206
pokey_irqen                    = $D20E
pokey_irqst                    = $D20E
pokey_kbcode                   = $D209
pokey_pot0                     = $D200
pokey_pot1                     = $D201
pokey_pot2                     = $D202
pokey_pot3                     = $D203
pokey_pot4                     = $D204
pokey_pot5                     = $D205
pokey_pot6                     = $D206
pokey_pot7                     = $D207
pokey_potgo                    = $D20B
pokey_random                   = $D20A
pokey_serin                    = $D20D
pokey_serout                   = $D20D
pokey_skctl                    = $D20F
pokey_skrest                   = $D20A
pokey_skstat                   = $D20F
pokey_stimer                   = $D209
pokey_unuse1                   = $D20C
pokey_unuse2                   = $D20B
pokey_unuse3                   = $D20C
printScore                     = $20C3
printScore$iter                = $00A6
printScore$tmp.array           = $00A9
printScore$val                 = $00A7
reset_routine_addr             = $FFFC
reset_routine_addr.hi          = $FFFD
reset_routine_addr.lo          = $FFFC
scores.array                   = $0080
scores.first                   = $0080
screen                         = $00B2
screen.hi                      = $00B3
screen.lo                      = $00B2
segment.default.bank           = $0000
segment.default.end            = $BFFF
segment.default.heapstart      = $2000
segment.default.length         = $9EB7
segment.default.start          = $2149
    ; $0000 = __rwdata_end
    ; $0000 = __rwdata_start
    ; $0000 = os_LINZBS
    ; $0000 = os_LNFLG
    ; $0000 = segment.default.bank
    ; $0001 = os_NGFLAG
    ; $0002 = os_CASINI
    ; $0002 = os_CASINI.lo
    ; $0003 = os_CASINI.hi
    ; $0004 = os_RAMLO
    ; $0004 = os_RAMLO.lo
    ; $0005 = os_RAMLO.hi
    ; $0006 = os_TRAMSZ
    ; $0007 = os_CMCMD
    ; $0008 = os_WARMST
    ; $0009 = os_BOOTQ
    ; $000A = os_DOSVEC
    ; $000A = os_DOSVEC.lo
    ; $000B = os_DOSVEC.hi
    ; $000C = os_DOSINI
    ; $000C = os_DOSINI.lo
    ; $000D = os_DOSINI.hi
    ; $000E = os_APPMHI
    ; $000E = os_APPMHI.lo
    ; $000F = os_APPMHI.hi
    ; $0010 = os_INTZBS
    ; $0010 = os_POKMSK
    ; $0011 = os_BRKKEY
    ; $0012 = os_RTCLOK
    ; $0012 = os_RTCLOK.b0
    ; $0012 = os_RTCLOK.loword
    ; $0012 = os_RTCLOK.loword.lo
    ; $0013 = os_RTCLOK.b1
    ; $0013 = os_RTCLOK.hiword
    ; $0013 = os_RTCLOK.hiword.lo
    ; $0013 = os_RTCLOK.loword.hi
    ; $0014 = os_RTCLOK.b2
    ; $0014 = os_RTCLOK.hiword.hi
    ; $0015 = os_BUFADR
    ; $0015 = os_BUFADR.lo
    ; $0016 = os_BUFADR.hi
    ; $0017 = os_ICCOMT
    ; $0018 = os_DSKFMS
    ; $0018 = os_DSKFMS.lo
    ; $0019 = os_DSKFMS.hi
    ; $001A = os_DSKUTL
    ; $001A = os_DSKUTL.lo
    ; $001B = os_DSKUTL.hi
    ; $001C = os_ABUFPT
    ; $0020 = os_ICHIDZ
    ; $0020 = os_IOCBAS
    ; $0020 = os_ZIOCB
    ; $0021 = os_ICDNOZ
    ; $0022 = os_ICCOMZ
    ; $0023 = os_ICSTAZ
    ; $0024 = os_ICBALZ
    ; $0025 = os_ICBAHZ
    ; $0026 = os_ICPTLZ
    ; $0027 = os_ICPTHZ
    ; $0028 = os_ICBLLZ
    ; $0029 = os_ICBLHZ
    ; $002A = os_ICAX1Z
    ; $002B = os_ICAX2Z
    ; $002C = os_ICSPRZ
    ; $002E = os_ICIDNO
    ; $002F = os_CIOCHR
    ; $0030 = os_STATUS
    ; $0031 = os_CHKSUM
    ; $0032 = os_BUFRLO
    ; $0033 = os_BUFRHI
    ; $0034 = __zeropage_usage
    ; $0034 = os_BFENLO
    ; $0035 = os_BFENHI
    ; $0036 = os_LTEMP
    ; $0036 = os_LTEMP.lo
    ; $0037 = os_LTEMP.hi
    ; $0038 = os_BUFRFL
    ; $0039 = os_RECVDN
    ; $003A = os_XMTDON
    ; $003B = os_CHKSNT
    ; $003C = os_NOCKSM
    ; $003D = os_BPTR
    ; $003E = os_FTYPE
    ; $003F = os_FEOF
    ; $0040 = os_FREQ
    ; $0041 = os_SOUNDR
    ; $0042 = os_CRITIC
    ; $0043 = os_FMSZPG
    ; $0043 = os_ZBUFP
    ; $0043 = os_ZBUFP.lo
    ; $0044 = os_ZBUFP.hi
    ; $0045 = os_ZDRVA
    ; $0045 = os_ZDRVA.lo
    ; $0046 = os_ZDRVA.hi
    ; $0047 = os_ZSBA
    ; $0047 = os_ZSBA.lo
    ; $0048 = os_ZSBA.hi
    ; $0049 = os_ERRNO
    ; $004A = os_ZCHAIN
    ; $004A = os_ZCHAIN.lo
    ; $004B = os_ZCHAIN.hi
    ; $004C = os_DSTAT
    ; $004D = os_ATRACT
    ; $004E = os_DRKMSK
    ; $004F = os_COLRSH
    ; $0050 = os_TMPCHR
    ; $0051 = os_HOLD1
    ; $0052 = os_LMARGN
    ; $0053 = os_RMARGN
    ; $0054 = os_ROWCRS
    ; $0055 = os_COLCRS
    ; $0055 = os_COLCRS.lo
    ; $0056 = os_COLCRS.hi
    ; $0057 = os_DINDEX
    ; $0058 = os_SAVMSC
    ; $0058 = os_SAVMSC.lo
    ; $0059 = os_SAVMSC.hi
    ; $005A = os_OLDROW
    ; $005B = os_OLDCOL
    ; $005B = os_OLDCOL.lo
    ; $005C = os_OLDCOL.hi
    ; $005D = os_OLDCHR
    ; $005E = os_OLDADR
    ; $005E = os_OLDADR.lo
    ; $005F = os_OLDADR.hi
    ; $0060 = os_FKDEF
    ; $0060 = os_FKDEF.lo
    ; $0061 = os_FKDEF.hi
    ; $0062 = os_PALNTS
    ; $0063 = os_LOGCOL
    ; $0064 = os_ADRESS
    ; $0064 = os_ADRESS.lo
    ; $0065 = os_ADRESS.hi
    ; $0066 = os_MLTTMP
    ; $0066 = os_OPNTMP
    ; $0066 = os_TOADR
    ; $0066 = os_TOADR.lo
    ; $0067 = os_TOADR.hi
    ; $0068 = os_FRMADR
    ; $0068 = os_FRMADR.lo
    ; $0068 = os_SAVADR
    ; $0068 = os_SAVADR.lo
    ; $0069 = os_FRMADR.hi
    ; $0069 = os_SAVADR.hi
    ; $006A = os_RAMTOP
    ; $006B = os_BUFCNT
    ; $006C = os_BUFSTR
    ; $006C = os_BUFSTR.lo
    ; $006D = os_BUFSTR.hi
    ; $006E = os_BITMSK
    ; $006F = os_SHFAMT
    ; $0070 = os_ROWAC
    ; $0070 = os_ROWAC.lo
    ; $0071 = os_ROWAC.hi
    ; $0072 = os_COLAC
    ; $0072 = os_COLAC.lo
    ; $0073 = os_COLAC.hi
    ; $0074 = os_ENDPT
    ; $0074 = os_ENDPT.lo
    ; $0075 = os_ENDPT.hi
    ; $0076 = os_DELTAR
    ; $0077 = os_DELTAC
    ; $0077 = os_DELTAC.lo
    ; $0078 = os_DELTAC.hi
    ; $0079 = os_KEYDEF
    ; $0079 = os_KEYDEF.lo
    ; $007A = os_KEYDEF.hi
    ; $007B = os_SWPFLG
    ; $007C = os_HOLDCH
    ; $007D = os_INSDAT
    ; $007E = os_COUNTR
    ; $007E = os_COUNTR.lo
    ; $007F = os_COUNTR.hi
    ; $0080 = __zeropage_first
    ; $0080 = scores.array
    ; $0080 = scores.first
    ; $00A2 = __reg
    ; $00A6 = printScore$iter
    ; $00A7 = printScore$val
    ; $00A9 = printScore$tmp.array
    ; $00B0 = i
    ; $00B2 = screen
    ; $00B2 = screen.lo
    ; $00B3 = __zeropage_last
    ; $00B3 = screen.hi
    ; $00B4 = __zeropage_end
    ; $0200 = os_INTABS
    ; $0200 = os_INTABS.lo
    ; $0200 = os_VDSLST
    ; $0200 = os_VDSLST.lo
    ; $0201 = os_INTABS.hi
    ; $0201 = os_VDSLST.hi
    ; $0202 = os_VPRCED
    ; $0202 = os_VPRCED.lo
    ; $0203 = os_VPRCED.hi
    ; $0204 = os_VINTER
    ; $0204 = os_VINTER.lo
    ; $0205 = os_VINTER.hi
    ; $0206 = os_VBREAK
    ; $0206 = os_VBREAK.lo
    ; $0207 = os_VBREAK.hi
    ; $0208 = os_VKEYBD
    ; $0208 = os_VKEYBD.lo
    ; $0209 = os_VKEYBD.hi
    ; $020A = os_VSERIN
    ; $020A = os_VSERIN.lo
    ; $020B = os_VSERIN.hi
    ; $020C = os_VSEROR
    ; $020C = os_VSEROR.lo
    ; $020D = os_VSEROR.hi
    ; $020E = os_VSEROC
    ; $020E = os_VSEROC.lo
    ; $020F = os_VSEROC.hi
    ; $0210 = os_VTIMR1
    ; $0210 = os_VTIMR1.lo
    ; $0211 = os_VTIMR1.hi
    ; $0212 = os_VTIMR2
    ; $0212 = os_VTIMR2.lo
    ; $0213 = os_VTIMR2.hi
    ; $0214 = os_VTIMR4
    ; $0214 = os_VTIMR4.lo
    ; $0215 = os_VTIMR4.hi
    ; $0216 = os_VIMIRQ
    ; $0216 = os_VIMIRQ.lo
    ; $0217 = os_VIMIRQ.hi
    ; $0218 = os_CDTMV1
    ; $0218 = os_CDTMV1.lo
    ; $0219 = os_CDTMV1.hi
    ; $021A = os_CDTMV2
    ; $021A = os_CDTMV2.lo
    ; $021B = os_CDTMV2.hi
    ; $021C = os_CDTMV3
    ; $021C = os_CDTMV3.lo
    ; $021D = os_CDTMV3.hi
    ; $021E = os_CDTMV4
    ; $021E = os_CDTMV4.lo
    ; $021F = os_CDTMV4.hi
    ; $0220 = os_CDTMV5
    ; $0220 = os_CDTMV5.lo
    ; $0221 = os_CDTMV5.hi
    ; $0222 = os_VVBLKI
    ; $0222 = os_VVBLKI.lo
    ; $0223 = os_VVBLKI.hi
    ; $0224 = os_VVBLKD
    ; $0224 = os_VVBLKD.lo
    ; $0225 = os_VVBLKD.hi
    ; $0226 = os_CDTMA1
    ; $0226 = os_CDTMA1.lo
    ; $0227 = os_CDTMA1.hi
    ; $0228 = os_CDTMA2
    ; $0228 = os_CDTMA2.lo
    ; $0229 = os_CDTMA2.hi
    ; $022A = os_CDTMF3
    ; $022B = os_SRTIMR
    ; $022C = os_CDTMF4
    ; $022D = os_INTEMP
    ; $022E = os_CDTMF5
    ; $022F = os_SDMCTL
    ; $0230 = os_SDLST
    ; $0230 = os_SDLST.lo
    ; $0230 = os_SDLSTL
    ; $0231 = os_SDLST.hi
    ; $0231 = os_SDLSTH
    ; $0232 = os_SSKCTL
    ; $0233 = os_LCOUNT
    ; $0234 = os_LPENH
    ; $0235 = os_LPENV
    ; $0236 = os_BRKKY
    ; $0236 = os_BRKKY.lo
    ; $0237 = os_BRKKY.hi
    ; $0238 = os_VPIRQ
    ; $0238 = os_VPIRQ.lo
    ; $0239 = os_VPIRQ.hi
    ; $023A = os_CDEVIC
    ; $023B = os_CCOMND
    ; $023C = os_CAUX1
    ; $023D = os_CAUX2
    ; $023E = os_TEMP
    ; $023F = os_ERRFLG
    ; $0240 = os_DFLAGS
    ; $0241 = os_DBSECT
    ; $0242 = os_BOOTAD
    ; $0242 = os_BOOTAD.lo
    ; $0243 = os_BOOTAD.hi
    ; $0244 = os_COLDST
    ; $0245 = os_RECLEN
    ; $0246 = os_DSKTIM
    ; $0247 = os_PDVMSK
    ; $0248 = os_SHPDVS
    ; $0249 = os_PDIMSK
    ; $024A = os_RELADR
    ; $024A = os_RELADR.lo
    ; $024B = os_RELADR.hi
    ; $024C = os_PPTMPA
    ; $024D = os_PPTMPX
    ; $026B = os_CHSALT
    ; $026C = os_VSFLAG
    ; $026D = os_KEYDIS
    ; $026E = os_FINE
    ; $026F = os_GPRIOR
    ; $0270 = os_PADDL0
    ; $0271 = os_PADDL1
    ; $0272 = os_PADDL2
    ; $0273 = os_PADDL3
    ; $0274 = os_PADDL4
    ; $0275 = os_PADDL5
    ; $0276 = os_PADDL6
    ; $0277 = os_PADDL7
    ; $0278 = os_STICK0
    ; $0279 = os_STICK1
    ; $027A = os_STICK2
    ; $027B = os_STICK3
    ; $027C = os_PTRIG0
    ; $027D = os_PTRIG1
    ; $027E = os_PTRIG2
    ; $027F = os_PTRIG3
    ; $0280 = os_PTRIG4
    ; $0281 = os_PTRIG5
    ; $0281 = os_PTRIG6
    ; $0283 = os_PTRIG7
    ; $0284 = os_STRIG0
    ; $0285 = os_STRIG1
    ; $0286 = os_STRIG2
    ; $0287 = os_STRIG3
    ; $0288 = os_HIBYTE
    ; $0289 = os_WMODE
    ; $028A = os_BLIM
    ; $028B = os_IMASK
    ; $028C = os_JVECK
    ; $028C = os_JVECK.lo
    ; $028D = os_JVECK.hi
    ; $028E = os_NEWADR
    ; $028E = os_NEWADR.lo
    ; $028F = os_NEWADR.hi
    ; $0290 = os_TXTROW
    ; $0291 = os_TXTCOL
    ; $0291 = os_TXTCOL.lo
    ; $0292 = os_TXTCOL.hi
    ; $0293 = os_TINDEX
    ; $0294 = os_TXTMSC
    ; $0296 = os_TXTOLD
    ; $029C = os_CRETRY
    ; $029D = os_HOLD3
    ; $029E = os_SUBTMP
    ; $029F = os_HOLD2
    ; $02A0 = os_DMASK
    ; $02A1 = os_TMPLBT
    ; $02A2 = os_ESCFLG
    ; $02A3 = os_TABMAP
    ; $02B2 = os_LOGMAP
    ; $02B6 = os_INVFLG
    ; $02B7 = os_FILFLG
    ; $02B8 = os_TMPROW
    ; $02B9 = os_TMPCOL
    ; $02B9 = os_TMPCOL.lo
    ; $02BA = os_TMPCOL.hi
    ; $02BB = os_SCRFLG
    ; $02BC = os_HOLD4
    ; $02BD = os_DRETRY
    ; $02BE = os_SHFLOK
    ; $02BF = os_BOTSCR
    ; $02C0 = os_PCOLR0
    ; $02C1 = os_PCOLR1
    ; $02C2 = os_PCOLR2
    ; $02C3 = os_PCOLR3
    ; $02C4 = os_COLOR0
    ; $02C5 = os_COLOR1
    ; $02C6 = os_COLOR2
    ; $02C7 = os_COLOR3
    ; $02C8 = os_COLOR4
    ; $02C9 = os_PARMBL
    ; $02C9 = os_RUNADR
    ; $02C9 = os_RUNADR.lo
    ; $02CA = os_RUNADR.hi
    ; $02CB = os_HIUSED
    ; $02CB = os_HIUSED.lo
    ; $02CC = os_HIUSED.hi
    ; $02CD = os_ZHIUSE
    ; $02CD = os_ZHIUSE.lo
    ; $02CE = os_ZHIUSE.hi
    ; $02CF = os_GBYTEA
    ; $02CF = os_GBYTEA.lo
    ; $02CF = os_OLDPAR
    ; $02D0 = os_GBYTEA.hi
    ; $02D1 = os_LOADAD
    ; $02D1 = os_LOADAD.lo
    ; $02D2 = os_LOADAD.hi
    ; $02D3 = os_ZLOADA
    ; $02D3 = os_ZLOADA.lo
    ; $02D4 = os_ZLOADA.hi
    ; $02D5 = os_DSCTLN
    ; $02D5 = os_DSCTLN.lo
    ; $02D6 = os_DSCTLN.hi
    ; $02D7 = os_ACMISR
    ; $02D7 = os_ACMISR.lo
    ; $02D8 = os_ACMISR.hi
    ; $02D9 = os_KRPDEL
    ; $02DA = os_KEYREP
    ; $02DB = os_NOCLIK
    ; $02DC = os_HELPFG
    ; $02DD = os_DMASAV
    ; $02DE = os_PBPNT
    ; $02DF = os_PBUFSZ
    ; $02E0 = os_GLBABS
    ; $02E0 = os_RUNAD
    ; $02E0 = os_RUNAD.lo
    ; $02E1 = os_RUNAD.hi
    ; $02E2 = os_INITAD
    ; $02E2 = os_INITAD.lo
    ; $02E3 = os_INITAD.hi
    ; $02E4 = os_RAMSIZ
    ; $02E5 = os_MEMTOP
    ; $02E5 = os_MEMTOP.lo
    ; $02E6 = os_MEMTOP.hi
    ; $02E7 = os_MEMLO
    ; $02E7 = os_MEMLO.lo
    ; $02E8 = os_MEMLO.hi
    ; $02E9 = os_HNDLOD
    ; $02EA = os_DVSTAT
    ; $02EE = os_CBAUDL
    ; $02EF = os_CBAUDH
    ; $02F0 = os_CRSINH
    ; $02F1 = os_KEYDEL
    ; $02F2 = os_CH1
    ; $02F3 = os_CHACT
    ; $02F4 = os_CHBAS
    ; $02F5 = os_NEWROW
    ; $02F6 = os_NEWCOL
    ; $02F6 = os_NEWCOL.lo
    ; $02F7 = os_NEWCOL.hi
    ; $02F8 = os_ROWINC
    ; $02F9 = os_COLINC
    ; $02FA = os_CHAR
    ; $02FB = os_ATACHR
    ; $02FC = os_CH
    ; $02FD = os_FILDAT
    ; $02FE = os_DSPFLG
    ; $02FF = os_SSFLAG
    ; $0300 = os_DCB
    ; $0300 = os_DDEVIC
    ; $0301 = os_DUNIT
    ; $0302 = os_DCOMND
    ; $0303 = os_DSTATS
    ; $0304 = os_DBUFLO
    ; $0305 = os_DBUFHI
    ; $0306 = os_DTIMLO
    ; $0307 = os_DUNUSE
    ; $0308 = os_DBYTLO
    ; $0309 = os_DBYTHI
    ; $030A = os_DAUX1
    ; $030B = os_DAUX2
    ; $030C = os_TIMER1
    ; $030C = os_TIMER1.lo
    ; $030D = os_TIMER1.hi
    ; $030E = os_JMPERS
    ; $030F = os_CASFLG
    ; $0310 = os_TIMER2
    ; $0310 = os_TIMER2.lo
    ; $0311 = os_TIMER2.hi
    ; $0312 = os_TEMP1
    ; $0312 = os_TEMP1.lo
    ; $0313 = os_TEMP1.hi
    ; $0313 = os_TEMP2
    ; $0314 = os_PTIMOT
    ; $0315 = os_TEMP3
    ; $0316 = os_SAVIO
    ; $0317 = os_TIMFLG
    ; $0318 = os_STACKP
    ; $0319 = os_TSTAT
    ; $031A = os_HATABS
    ; $033D = os_PUPBT1
    ; $033E = os_PUPBT2
    ; $033F = os_PUPBT3
    ; $0340 = os_IOCB0
    ; $0350 = os_IOCB1
    ; $0360 = os_IOCB2
    ; $0370 = os_IOCB3
    ; $0380 = os_IOCB4
    ; $0390 = os_IOCB5
    ; $03A0 = os_IOCB6
    ; $03B0 = os_IOCB7
    ; $03C0 = os_PRNBUF
    ; $03E8 = os_SUPERF
    ; $03E9 = os_CKEY
    ; $03EA = os_CASSBT
    ; $03EB = os_CARTCK
    ; $03EC = os_DERRF
    ; $03ED = os_ACMVAR
    ; $03F8 = os_BASICF
    ; $03F9 = os_MINTLK
    ; $03FA = os_GINTLK
    ; $03FB = os_CHLINK
    ; $03FB = os_CHLINK.lo
    ; $03FC = os_CHLINK.hi
    ; $03FD = os_CASBUF
    ; $0480 = os_USAREA
    ; $057E = os_LBPR1
    ; $057F = os_LBPR2
    ; $0580 = os_LBUFF
    ; $0700 = os_INIML
    ; $2000 = __heap_start
    ; $2000 = main
    ; $2000 = segment.default.heapstart
    ; $2004 = .do__00015
    ; $201D = .wh__00018
    ; $2024 = .ai__00039pause$.rt_check
    ; $202E = .wh__00022
    ; $204A = .he__00023
    ; $205B = .ew__00021
    ; $2066 = .ai__00040pause$.rt_check
    ; $2070 = .wh__00028
    ; $208C = .he__00029
    ; $20A8 = .do__00032
    ; $20C1 = .wh__00035
    ; $20C3 = printScore
    ; $20E1 = .do__00005
    ; $20ED = .el__00008
    ; $20F3 = .fi__00009
    ; $2120 = .el__00010
    ; $2125 = .fi__00011
    ; $212A = .el__00012
    ; $213D = .fi__00013
    ; $2148 = .ah__00014
    ; $2149 = segment.default.start
    ; $9EB7 = segment.default.length
    ; $BFFA = os_CARTCS
    ; $BFFA = os_CARTCS.lo
    ; $BFFB = os_CARTCS.hi
    ; $BFFC = os_CART
    ; $BFFD = os_CARTFG
    ; $BFFE = os_CARTAD
    ; $BFFE = os_CARTAD.lo
    ; $BFFF = os_CARTAD.hi
    ; $BFFF = segment.default.end
    ; $CC00 = os_ICSORG.array
    ; $CC00 = os_ICSORG.first
    ; $D000 = gtia_hposp0
    ; $D000 = gtia_m0pf
    ; $D001 = gtia_hposp1
    ; $D001 = gtia_m1pf
    ; $D002 = gtia_hposp2
    ; $D002 = gtia_m2pf
    ; $D003 = gtia_hposp3
    ; $D003 = gtia_m3pf
    ; $D004 = gtia_hposm0
    ; $D004 = gtia_p0pf
    ; $D005 = gtia_hposm1
    ; $D005 = gtia_p1pf
    ; $D006 = gtia_hposm2
    ; $D006 = gtia_p2pf
    ; $D007 = gtia_hposm3
    ; $D007 = gtia_p3pf
    ; $D008 = gtia_m0pl
    ; $D008 = gtia_sizep0
    ; $D009 = gtia_m1pl
    ; $D009 = gtia_sizep1
    ; $D00A = gtia_m2pl
    ; $D00A = gtia_sizep2
    ; $D00B = gtia_m3pl
    ; $D00B = gtia_sizep3
    ; $D00C = gtia_p0pl
    ; $D00C = gtia_sizem
    ; $D00D = gtia_grafp0
    ; $D00D = gtia_p1pl
    ; $D00E = gtia_grafp1
    ; $D00E = gtia_p2pl
    ; $D00F = gtia_grafp2
    ; $D00F = gtia_p3pl
    ; $D010 = gtia_grafp3
    ; $D010 = gtia_trig0
    ; $D011 = gtia_grafm
    ; $D011 = gtia_trig1
    ; $D012 = gtia_colpm0
    ; $D012 = gtia_trig2
    ; $D013 = gtia_colpm1
    ; $D013 = gtia_trig3
    ; $D014 = gtia_colpm2
    ; $D014 = gtia_pal
    ; $D015 = gtia_colpm3
    ; $D016 = gtia_colpf0
    ; $D017 = gtia_colpf1
    ; $D018 = gtia_colpf2
    ; $D019 = gtia_colpf3
    ; $D01A = gtia_colbk
    ; $D01B = gtia_prior
    ; $D01C = gtia_vdelay
    ; $D01D = gtia_gractl
    ; $D01E = gtia_hitclr
    ; $D01F = gtia_consol
    ; $D200 = pokey_audf1
    ; $D200 = pokey_pot0
    ; $D201 = pokey_audc1
    ; $D201 = pokey_pot1
    ; $D202 = pokey_audf2
    ; $D202 = pokey_pot2
    ; $D203 = pokey_audc2
    ; $D203 = pokey_pot3
    ; $D204 = pokey_audf3
    ; $D204 = pokey_pot4
    ; $D205 = pokey_audc3
    ; $D205 = pokey_pot5
    ; $D206 = pokey_audf4
    ; $D206 = pokey_pot6
    ; $D207 = pokey_audc4
    ; $D207 = pokey_pot7
    ; $D208 = pokey_allpot
    ; $D208 = pokey_audctl
    ; $D209 = pokey_kbcode
    ; $D209 = pokey_stimer
    ; $D20A = pokey_random
    ; $D20A = pokey_skrest
    ; $D20B = pokey_potgo
    ; $D20B = pokey_unuse2
    ; $D20C = pokey_unuse1
    ; $D20C = pokey_unuse3
    ; $D20D = pokey_serin
    ; $D20D = pokey_serout
    ; $D20E = pokey_irqen
    ; $D20E = pokey_irqst
    ; $D20F = pokey_skctl
    ; $D20F = pokey_skstat
    ; $D300 = pia_porta
    ; $D301 = pia_portb
    ; $D302 = pia_pactl
    ; $D303 = pia_pbctl
    ; $D400 = antic_dmactl
    ; $D401 = antic_chactl
    ; $D402 = antic_dlist
    ; $D402 = antic_dlist.lo
    ; $D402 = antic_dlistl
    ; $D403 = antic_dlist.hi
    ; $D403 = antic_dlisth
    ; $D404 = antic_hscrol
    ; $D405 = antic_vscrol
    ; $D406 = antic_unuse0
    ; $D407 = antic_pmbase
    ; $D408 = antic_unuse1
    ; $D409 = antic_chbase
    ; $D40A = antic_wsync
    ; $D40B = antic_vcount
    ; $D40C = antic_penh
    ; $D40D = antic_penv
    ; $D40E = antic_nmien
    ; $D40F = antic_nmires
    ; $D40F = antic_nmist
    ; $E000 = os_DCSORG.array
    ; $E000 = os_DCSORG.first
    ; $E400 = os_EDITRV.array
    ; $E400 = os_EDITRV.first
    ; $E410 = os_SCRENV.array
    ; $E410 = os_SCRENV.first
    ; $E420 = os_KEYBDV.array
    ; $E420 = os_KEYBDV.first
    ; $E430 = os_PRINTV.array
    ; $E430 = os_PRINTV.first
    ; $E440 = os_CASETV.array
    ; $E440 = os_CASETV.first
    ; $FFFA = nmi_routine_addr
    ; $FFFA = nmi_routine_addr.lo
    ; $FFFA = os_NMIVEC
    ; $FFFA = os_NMIVEC.lo
    ; $FFFB = nmi_routine_addr.hi
    ; $FFFB = os_NMIVEC.hi
    ; $FFFC = os_RESVEC
    ; $FFFC = os_RESVEC.lo
    ; $FFFC = reset_routine_addr
    ; $FFFC = reset_routine_addr.lo
    ; $FFFD = os_RESVEC.hi
    ; $FFFD = reset_routine_addr.hi
    ; $FFFE = irq_routine_addr
    ; $FFFE = irq_routine_addr.lo
    ; $FFFE = os_IRQVEC
    ; $FFFE = os_IRQVEC.lo
    ; $FFFF = irq_routine_addr.hi
    ; $FFFF = os_IRQVEC.hi