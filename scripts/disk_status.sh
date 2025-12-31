#!/bin/bash
free=$(df -h / | awk 'NR==2 {print $4}')
echo " $free free"
