#!/bin/bash

template="# {date}

## Morning

### Mood

### Gratitude

### Reflections


## Afternoon

### Highlights

### Challenges

### Lessons Learned


## Evening

### Interactions

### Thoughts and Emotions

### Plans for Tomorrow


## Closing Thoughts


"

date=$(date -I)

echo "$template" | sed "s/{date}/$date/g"
