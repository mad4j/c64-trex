

10 REM CLEAR SCREEN
20 PRINT CHR$(147)

30 REM SET BORDER AND BACKG COLOR
40 POKE 53280,15: POKE 53281,15

50 REM READ LOAD SPRITE#0 DATA
60 FOR X=12800 TO 12991: READ Y: POKE X,Y: NEXT X

70 REM SPRITE#0 POINTER
80 P=1016 + 1024*(PEEK(53272) AND 240)/16
90 POKE P,200: POKE 53269,1

100 REM SPRIE#0 IN HIGH RESOLUTION
110 POKE 53276,PEEK(53276) AND 255

120 REM SPRITE#0 COLOR AND WIDTH HEGHT PROPS
130 POKE 53287,0: POKE 53271,0: POKE 53277,0

140 REM SPRITE#0 X,Y POSISTION
150 POKE 53264,0: POKE 53248,50: POKE 53249,150

500 K=0
510 POKE P,200+K
520 K=K+1 : IF K=3 THEN K=0
525 FOR T=0 TO 50 : NEXT
530 GOTO 510

1000 REM TRex Runnig 1/3
1010 DATA 000,001,254,000,003,127,000,003
1020 DATA 255,000,003,255,000,003,255,000
1030 DATA 003,224,000,003,252,008,007,192
1040 DATA 008,015,192,012,063,240,014,127
1050 DATA 208,015,255,192,015,255,192,007
1060 DATA 255,192,003,255,128,001,255,000
1070 DATA 000,254,000,000,230,000,000,194
1080 DATA 000,000,130,000,000,195,000,000
1090 REM TRex Runnig 2/3
1100 DATA 000,001,254,000,003,127,000,003
1110 DATA 255,000,003,255,000,003,255,000
1120 DATA 003,224,000,003,252,008,007,192
1130 DATA 008,015,192,012,063,240,014,127
1140 DATA 208,15,255,192,15,255,192,7
1150 DATA 255,192,3,255,128,1,255,0
1160 DATA 0,254,0,0,227,128,0,192
1170 DATA 0,0,128,0,0,192,0,0
1180 REM TRex Runnig 3/3
1190 DATA 0,1,254,0,3,127,0,3
1200 DATA 255,0,3,255,0,3,255,0
1210 DATA 3,224,0,3,252,8,7,192
1220 DATA 8,15,192,12,63,240,14,127
1230 DATA 208,15,255,192,15,255,192,7
1240 DATA 255,192,3,255,128,1,255,0
1250 DATA 0,254,0,0,198,0,0,98
1260 DATA 0,0,2,0,0,3,0,0