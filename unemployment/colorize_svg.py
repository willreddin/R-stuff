import csv
from bs4 import BeautifulSoup

reader = csv.reader(open('unemployment-aug2010.txt', 'r'), delimiter=",")

svg = open('counties.svg', 'r').read()

unemployment = {}
min_value = 100; max_value = 0
for row in reader:

	try:
		full_fips = row[1] + row[2]
		rate = float( row[8].strip() )
		unemployment[full_fips] = rate

	except:
		pass

soup = BeautifulSoup(svg, selClosingTags=['defs', 'sodipodi:namedview'])

paths = soup.findAll('path')

colors = ["#F1EEF6", "#D4B9DA", "#C994C7", "#DF65B0", "#DD1C77", "#980043"]

path_style = 'font-size:12px;fill-rule:nonzero;stroke:#ffffff;stroke-opacity:1;stroke-width:0.1;stroke-miterlimit:4;stroke-linejoin:bevel;fill:'

for p in paths:
	if p['id'] not in ["State_Lines", "separator"]:
		# pass
		try:
			rate = unemployment[p['id']]
		except:
			continue

		if rate > 10:
			color_class = 5
		elif rate > 8:
			color_class = 4
		elif rate > 6:
			color_class = 3
		elif rate > 4:
			color_class = 2
		elif rate > 2:
			color_class = 1
		else:
			color_class = 0

		color = colors[color_class]
		p['style'] = path_style + color

print soup.prettify()