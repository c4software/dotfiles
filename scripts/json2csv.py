#! /usr/bin/env python2

import json
import sys

if(len(sys.argv) < 1):
	exit("Usage: {} fichier.json".format(sys.argv[0]))

content = json.load(open(sys.argv[1], 'r'))
for element in content['results']:
    print ','.join([str(element[key]) for key in element])