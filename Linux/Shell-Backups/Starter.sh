#!/bin/sh

echo "|| Backing up... ||"
echo "|| This will show very little until done. Everything is in log.txt. ||"

sudo chmod -R 777 ./
export curdir="${PWD}"

for itemfile in ./Items/*.sh; do
  echo "|| ${itemfile} ||"
  ${itemfile} >> log.txt
done

if [ -f "./log3.txt" ]; then
	sudo rm ./log3.txt
fi
if [ -f "./log2.txt" ]; then
	sudo mv ./log2.txt ./log3.txt
fi
if [ -f "./log1.txt" ]; then
	sudo mv ./log1.txt ./log2.txt
fi
if [ -f "./log.txt" ]; then
	sudo mv ./log.txt ./log1.txt
fi

echo "|| Everything backed up. ||"
