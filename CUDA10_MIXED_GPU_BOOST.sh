#!/bin/bash
echo "Enable Persistent Mode"
nvidia-smi -pm 1
for(( x =0 ; x <  `nvidia-smi| grep N/A |wc -l` ; x++))
do
        
        GName=`nvidia-smi -q -i $x |grep "Product Name" | cut -d ":" -f2 |cut -d " " -f3`
        Memory=`nvidia-smi  -i $x -q | grep Memory | grep Hz | tail -n 1 | cut -d ":" -f2 | cut -d " " -f2`
        Graphic=`nvidia-smi  -i $x -q | grep Graphic | head -n 4 | tail -n 1 | cut -d ":" -f2 | cut -d " " -f2`
        echo "Setup : $GName-> Application clock= $Memory,$Graphic"
        
        nvidia-smi -i $x -ac  $Memory,$Graphic
done
