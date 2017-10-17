from mecode import G

#######################################
#####          VARIABLES          #####
#######################################

FEED_RATE = 100 # mm/s

SAVE_GCODE_FILE = True
FILE_NAME = "mTest_03.gcode"

FILE_END = "m2"

# You probably want this to be true
PRINT_LINES = True



if SAVE_GCODE_FILE==True:
	try:
		with G(outfile=FILE_NAME, print_lines=PRINT_LINES) as g:
			g.feed(rate=FEED_RATE)

			###########################
			#####  YOUR CODE HERE #####
			###########################

			g.home()
		print FILE_END


	except Exception as e:
		raise e
else:
	try:
		with G(print_lines=PRINT_LINES) as g:
			g.feed(rate=FEED_RATE)

			###########################
			#####  YOUR CODE HERE #####
			###########################

			g.home()
	except Exception as e:
		raise e

print FILE_END