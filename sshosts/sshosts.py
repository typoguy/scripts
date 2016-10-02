#!/usr/bin/env python

from os.path import isfile
from os import environ
from sys import version_info

configpath = environ['HOME'] + '/.ssh/config'

if not isfile(configpath):
	tmp = "Path to ssh config file: "
	configpath = raw_input(tmp) if version_info[0] < 3 else input(tmp)

configfile = open(configpath, 'r')

for host in configfile:
	host = host.strip()
	host = host.split(' ')

	if host[0] == 'Host':
		print(host[1])

configfile.close()
