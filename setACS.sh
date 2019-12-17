#!/bin/bash

for y in ` lspci -vvv| grep "Root Port" | grep "Normal decode" | grep PCI |cut -c1-7 `;
do
        cpu="0x0" #------- => cpu=0x0 , +++++-- => cpu=0x1f , +-+++-- => cpu=0x1d
        echo "CPU setACS : $cpu"
        setpci -s $y  116.w=$cpu
        lspci -s $y
        lspci -vvv -s $y | grep ACSCtl  #輸出目前PLX更改的結果
done
for y in ` lspci   | grep PLX |grep bridge|cut -c1-7 `;
do
                plx="0x0"  #------- => cpu=0x0 , +++++++ => cpu=0x7f , +-+++-- => cpu=0x1d
                echo "PLX setACS : $plx"
                setpci -s $y f2a.w=$plx
                lspci -s $y
                lspci -vvv -s $y | grep ACSCtl  #輸出目前PLX更改的結果

done
