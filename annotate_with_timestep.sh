for i
do
 count=` echo $i | cut -f2 -d\. ` # Format looks like: MAPI.00174.ppm
 time=` echo $count | awk '{printf "%.3f ps",$1*0.025}' ` # 0.025 ps per frame
 echo $time
 convert "${i}" -font ./FuturaMediumBT.ttf -weight 700 -pointsize 120 -draw "gravity SouthEast fill black text 120,60 '${time}'" annotate_${i%.*}.png 
done

# outputs look like: annotate_MAPI.08361.png
#
# Rendered to high quality MP4 for Youtube by:
#  ffmpeg -framerate 25 -i annotate_MAPI.%05d.png -s:v 1920x1080 -c:v libx264 -profile:v high -crf 18 -pix_fmt yuv420p -r 25 MAPI_salt_cellar_annotate.mp4
