from mecode import G

with G(outfile="mTest_01.gcode") as g:
	g.feed(rate=10)
	g.move(10,10)
	g.arc(x=1, y=15, radius=20, direction='CCW')
	g.meander(5,10,spacing=1)
	g.abs_move(x=1,y=1)
	g.home()
