
!- Running TRex
!- 2018, Daniele Olmisani <daniele.olmisani@gmail.com>


#region "screen initialization"

!- Clear screen and set border and backg color
10 PRINT CHR$(147)
20 POKE 53280,15: POKE 53281,15

#endregion

#region "sprite initialization"

!- Load sprite data starting from address 12800
!- each sprite has 63+1 (padding) bytes
100 FOR X=12800 TO 12800+(64*4)-1: READ Y: POKE X,Y: NEXT X

!- Compute location of sprite pointer registers
!- Most significant bit of address 53272 specify the start of screen memory
!- in terms of pages of 1024 bytes
!- The first register is located after the screen memory (1016 bytes)
110 P=1016 + 1024*(PEEK(53272) AND 240)/16

!- Sprite table
!- ----------------
!- 200 TRex frame 1
!- 201 TRex frame 2
!- 202 TRex frame 3
!- 203 Cactus #1

!- Set the location of sprite data in terms of pages of 64 bytess
120 POKE P,200
125 POKE P+1,203

!- Enable sprite#0 and sprite#1
130 POKE 53269,PEEK(53269) OR 3

!- Set all sprites in High Resolution mode
140 POKE 53276,0

!- Set sprite#0 color
150 POKE 53287,0
!- Set sprite#1 color
155 POKE 53288,0

!- Set sprites double width and height attributes 
160 POKE 53271,0: POKE 53277,0

!- Set sprite#0 x,y position
!- Address 53264 contains sprite#0 x position (most significant bit)
!- Address 53248 contains sprite#0 x position (least 8 significant bits)
!- Address 53249 contains sprite#0 y position 
170 POKE 53264,PEEK(53264) AND 254: POKE 53248,24: POKE 53249,180

!- Set sprite#1 x,y position
!- Address 53264 contains sprite#0 x position (most significant bit)
!- Address 53248 contains sprite#0 x position (least 8 significant bits)
!- Address 53249 contains sprite#0 y position 
180 POKE 53264,PEEK(53264) OR 2: POKE 53250,0: POKE 53251,180

#endregion

#region "animation loop"

!- Animation loop
!-----------------

!- Animation counter
500 K=0
510 POKE P,200+K
520 K=K+1 : IF K=3 THEN K=0

!- Animation delay
525 FOR T=1 TO 50 : NEXT

530 GOTO 510

#endregion

#region "sprite data"

!- Sprite data
!- --------------------------------------

#region "trex sprites"

1000 REM TREX RUNNING 1/3
1010 DATA 000,001,254,000,003,127,000,003
1020 DATA 255,000,003,255,000,003,255,000
1030 DATA 003,224,000,003,252,008,007,192
1040 DATA 008,015,192,012,063,240,014,127
1050 DATA 208,015,255,192,015,255,192,007
1060 DATA 255,192,003,255,128,001,255,000
1070 DATA 000,254,000,000,230,000,000,194
1080 DATA 000,000,130,000,000,195,000,000

1090 REM TREX RUNNING 2/3
1100 DATA 000,001,254,000,003,127,000,003
1110 DATA 255,000,003,255,000,003,255,000
1120 DATA 003,224,000,003,252,008,007,192
1130 DATA 008,015,192,012,063,240,014,127
1140 DATA 208,015,255,192,015,255,192,007
1150 DATA 255,192,003,255,128,001,255,000
1160 DATA 000,254,000,000,227,128,000,192
1170 DATA 000,000,128,000,000,192,000,000

1180 REM TREX RUNNING 3/3
1190 DATA 000,001,254,000,003,127,000,003
1200 DATA 255,000,003,255,000,003,255,000
1210 DATA 003,224,000,003,252,008,007,192
1220 DATA 008,015,192,012,063,240,014,127
1230 DATA 208,015,255,192,015,255,192,007
1240 DATA 255,192,003,255,128,001,255,000
1250 DATA 000,254,000,000,198,000,000,098
1260 DATA 000,000,002,000,000,003,000,000

#endregion

#region "obstacle sprites"

2000 REM CACTUS #1
2010 DATA 000,028,000,000,062,000,001,062
2020 DATA 000,003,190,000,003,190,000,003
2030 DATA 190,032,003,190,112,003,190,112
2040 DATA 003,190,112,003,190,112,003,190
2050 DATA 112,003,190,112,003,254,112,001
2060 DATA 254,112,000,255,240,000,063,224
2070 DATA 000,063,192,000,062,000,000,062
2080 DATA 000,000,190,128,001,190,000,000

#endregion

#endregion