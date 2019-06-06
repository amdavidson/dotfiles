#!/bin/bash


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    free -h --si | head -n 2 | tail -n 1 | awk '{print $7}'
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    vm_stat | awk 'BEGIN{FS="[:]+"}{if(NR<7&&NR>1)sum+=$2; if(NR==2||NR==4||NR==5)free+=$2} END{printf "%3d%%\n",100*((sum - free)/sum)}'
else 
    echo "?" 
fi
