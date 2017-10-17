from mecode import G

with G(outfile='mTest_02.gcode') as g:
  g.feed(rate=100)
  g.meander(10,10,2)
  g.home()

# print "M2"