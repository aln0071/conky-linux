#!/bin/bash
# to panel
if sed -n 40p ~/.conkyrc | grep desktop;
then
	sed -i '41 s/undecorated,sticky,skip_taskbar,skip_pager,below/above/' ~/.conkyrc
	sed -i '40 s/desktop/panel/' ~/.conkyrc
else
# to desktop
	sed -i '41 s/above/undecorated,sticky,skip_taskbar,skip_pager,below/' ~/.conkyrc
	sed -i '40 s/panel/desktop/' ~/.conkyrc
fi
