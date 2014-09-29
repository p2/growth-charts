#!/bin/bash

# Use @2x versions to create other images
for f in *@2x.png; do
	if [[ ${f%@2x.png} != *-thumb ]]; then
		echo Converting $f
		convert "$f" -scale 50% "${f%@2x.png}.png"
		
		# make thumbs
		convert "$f" -resize 600x600 "${f%@2x.png}-thumb@2x.png"
		convert "$f" -resize 300x300 "${f%@2x.png}-thumb.png"
		
		# add a bit of roundness to thumbs
		R=12
		declare $(sips -g pixelWidth -g pixelHeight "${f%@2x.png}-thumb@2x.png" | awk '/Width/ { print "W="$2 } /Height/ { print "H="$2 }')
		convert -size "$W"x"$H" xc:none -draw "roundrectangle 0,0,$W,$H,$R,$R" mask.png
		convert "${f%@2x.png}-thumb@2x.png" -matte mask.png -compose DstIn -composite out.png && mv out.png "${f%@2x.png}-thumb@2x.png"
		R=6
		declare $(sips -g pixelWidth -g pixelHeight "${f%@2x.png}-thumb.png" | awk '/Width/ { print "W="$2 } /Height/ { print "H="$2 }')
		convert -size "$W"x"$H" xc:none -draw "roundrectangle 0,0,$W,$H,$R,$R" mask.png
		convert "${f%@2x.png}-thumb.png" -matte mask.png -compose DstIn -composite out.png    && mv out.png "${f%@2x.png}-thumb.png"
		rm mask.png
	fi
done
