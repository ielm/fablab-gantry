DVAR $hFile
DVAR $cCheck
DVAR $press
DVAR $length
DVAR $lame
DVAR $comport
DVAR $vacpress

$DO0.0=0
$DO1.0=0
$DO2.0=0
$DO3.0=0

Primary ; sets primary units mm and s
G65 F2000; accel speed mm/s^2
G66 F2000;accel speed mm/s^2


G91
G1 F10
G1 X10.000000
G1 Y2.000000
G1 X-10.000000
G1 Y2.000000
G1 X10.000000
G1 Y2.000000
G1 X-10.000000
G1 Y2.000000
G1 X10.000000
G1 Y2.000000
G1 X-10.000000
G90
G1 X1.000000 Y1.000000
G91
G90
G1 X0.000000 Y0.000000
G91
;#################################### Code ##########################################

M2

;##########Functions############;
DFS setPress

        $strtask1 = DBLTOSTR( $P, 0 )
        $strtask1 = "COM" + $strtask1
        $hFile = FILEOPEN $strtask1, 2
        COMMINIT $hFile, "baud=115200 parity=N data=8 stop=1"
        COMMSETTIMEOUT $hFile, -1, -1, 1000

        $press = $Q * 10.0
        $strtask2 = DBLTOSTR( $press , 0 )


        $length = STRLEN( $strtask2 )
        WHILE $length < 4.0
                $strtask2 = "0" + $strtask2
                $length = STRLEN( $strtask2 )
        ENDWHILE


        $strtask2 = "08PS  " + $strtask2

        $cCheck = 0.00
        $lame = STRTOASCII ($strtask2, 0)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 1)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 2)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 3)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 4)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 5)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 6)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 7)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 8)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 9)
        $cCheck = $cCheck - $lame

        WHILE( $cCheck) < 0
                $cCheck = $cCheck + 256
        ENDWHILE


        $strtask3 = makestring "{#H}" $cCheck
        $strtask3 = STRUPR( $strtask3 )
        $strtask2 = "\x02" + $strtask2 + $strtask3 + "\x03"

        FILEWRITE $hFile "\x05"
        FILEWRITE $hFile $strtask2
        FILEWRITE $hFile "\x04"


        FILECLOSE $hFile


ENDDFS

DFS setVac

        $strtask1 = DBLTOSTR( $P, 0 )
        $strtask1 = "COM" + $strtask1
        $hFile = FILEOPEN $strtask1, 2
        COMMINIT $hFile, "baud=115200 parity=N data=8 stop=1"
        COMMSETTIMEOUT $hFile, -1, -1, 1000

        $vacpress = $Q * 10.0
        $strtask2 = DBLTOSTR( $vacpress , 0 )


        $length = STRLEN( $strtask2 )
        WHILE $length < 4.0
                $strtask2 = "0" + $strtask2
                $length = STRLEN( $strtask2 )
        ENDWHILE


        $strtask2 = "08VS  " + $strtask2

        $cCheck = 0.00
        $lame = STRTOASCII ($strtask2, 0)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 1)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 2)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 3)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 4)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 5)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 6)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 7)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 8)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 9)
        $cCheck = $cCheck - $lame

        WHILE( $cCheck) < 0
                $cCheck = $cCheck + 256
        ENDWHILE


        $strtask3 = makestring "{#H}" $cCheck
        $strtask3 = STRUPR( $strtask3 )
        $strtask2 = "\x02" + $strtask2 + $strtask3 + "\x03"

        FILEWRITE $hFile "\x05"
        FILEWRITE $hFile $strtask2
        FILEWRITE $hFile "\x04"


        FILECLOSE $hFile


ENDDFS

DFS togglePress

        $strtask1 = DBLTOSTR( $P, 0 )
        $strtask1 = "COM" + $strtask1
        $hFile = FILEOPEN $strtask1, 2
        COMMINIT $hFile, "baud=115200 parity=N data=8 stop=1"
        COMMSETTIMEOUT $hFile, -1, -1, 1000


        $strtask2 = "04DI  "

        $cCheck = 0.00
        $lame = STRTOASCII ($strtask2, 0)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 1)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 2)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 3)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 4)
        $cCheck = $cCheck - $lame
        $lame = STRTOASCII( $strtask2, 5)
        $cCheck = $cCheck - $lame

        WHILE( $cCheck) < 0
                $cCheck = $cCheck + 256
        ENDWHILE


        $strtask3 = makestring "{#H}" $cCheck
        $strtask3 = STRUPR( $strtask3 )
        $strtask2 = "\x02" + $strtask2 + $strtask3 + "\x03"

        FILEWRITE $hFile "\x05"
        FILEWRITE $hFile $strtask2
        FILEWRITE $hFile "\x04"


        FILECLOSE $hFile
        G4 P0.15

ENDDFS
ENDDFS
