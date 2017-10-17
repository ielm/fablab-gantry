from mecode import G

with G(outfile='meander_01.gcode') as g:
  g.feed(rate=10)
  g.meander(10,10,2)
  g.abs_move(x=1,y=1)
  g.home()

