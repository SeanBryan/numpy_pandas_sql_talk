infile = open('311_dat.csv','r')
outfile = open('311_first_few.csv','w')

for i in xrange(400):
	# get a line, and write it out
	outfile.write(infile.readline())

outfile.flush()

infile.close()
outfile.close()