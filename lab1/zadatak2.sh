#!/bin/bash

grep -iE "(banana|jabuka|jagoda|dinja|lubenica)" namirnice.txt

grep -viE "(banana|jabuka|jagoda|dinja|lubenica)" namirnice.txt

grep -rE "(^| )[A-Z]{3}[0-9]{6}($| )" ~/projekti/

find . -mtime +6 -mtime -15 -ls

for i in $(seq 1 15); do echo $i; done

kraj=2
for i in $(seq 1 $kraj); do echo $i; done
