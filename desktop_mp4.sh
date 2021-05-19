#/bin/bash

host="$(hostname)"
echo $host
rm -f ./desktops/$host.mp4
rm -rf ./desktops/mfiles
mkdir ./desktops/mfiles
i=1
for f in ./desktops/$host_*.png
do
  num=$((i++))
  num0000="$(printf "%04d" $num)"
  echo "cp $f ./desktops/mfiles/$(hostname)_$num0000.png"
  cp $f ./desktops/mfiles/$(hostname)_$num0000.png
done

avconv -i "./desktops/mfiles/$(hostname)_%04d.png" -r 1 -c:v libx264 -crf 20  -pix_fmt yuv420p -r 1 ./desktops/$(hostname).mp4
#rm -rf ./desktops/mfiles
