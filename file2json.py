#! /usr/bin/env python
# -*- coding: utf-8 -*-
import json
words = file('englishword.smali','r')
dat = words.readlines();
dic = {}
for line in dat:
    a= line.strip()
    if a.startswith('const-string v3'):
        line = line[22:-2]
        line = line[line.find(' ')+1:]
        sep = line.find(' ')
        key = line[0:sep]
        value = line[sep+1:]
        value = value.decode('unicode-escape')
        if len(key) > 0:
            dic[key]=value
print json.JSONEncoder().encode(dic)