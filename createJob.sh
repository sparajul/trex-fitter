#!/bin/bash

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [<config_file>]"
    exit 0
fi

duration=00:30:00
#hupdate file.root *.root
#cat $1 | grep "Systematic: " | awk -F": " '{gsub(/ /,"",$2);printf "sbatch --time='$duration' -p htc --mem=4G  --wrap \"trex-fitter nd $1 \\\"Systematic=%s:SaveSuffix=_%s\\\"\"\n",$2,$2}'
#cat $1 | grep "Systematic: " | awk -F": " '{gsub(/ /,"",$2);printf "sbatch --time='$duration' -p htc --mem=4G  --wrap \"trex-fitter nd $1 \\\"Regions=%s:SaveSuffix=_%s\\\"\"\n",$2,$2}'
#cat $1 | grep "Sample: " | awk -F": " '{gsub(/ /,"",$2);printf "sbatch --time='$duration' -p htc --mem=4G  --wrap \"trex-fitter nd $1 \\\"Samples=%s:SaveSuffix=_%s\\\"\"\n",$2,$2}'
#cat $1 | egrep "^Sample: |^Region: "  | awk -F ":" 'BEGIN{i=0;j=0}{gsub(/"| /,"",$2);if($1=="Sample")smpl[x++]=$2;else region[y++]=$2}END{for (a in smpl) for (b in region) printf "sbatch --time=00:30:00 -p htc --mem=4G  --wrap \"trex-fitter nd '${1}' \\\"Regions=%s:Samples=%s:SaveSuffix=_%s_%s \\\"\n", region[b],smpl[a],region[b],smpl[a]}' 



#cat $1 | egrep "^Systematic: |^Region: "  | awk -F ":" 'BEGIN{i=0;j=0}{gsub(/ /,"",$2);if($1=="Systematic")syst[x++]=$2;else region[y++]=$2}END{for (a in syst) for (b in region) printf "sbatch --time=03:0:00 -p htc --mem=4G  --wrap \"trex-fitter n '${1}' \\\"Regions=%s:Systematics=%s:SaveSuffix=_%s_%s\\\"\"\n", region[b],syst[a],region[b],syst[a]}'


cat $1 | egrep "^Systematic: |^Region: "  | awk -F ":" 'BEGIN{i=0;j=0}{gsub(/ /,"",$2);if($1=="Systematic")syst[x++]=$2;else region[y++]=$2}END{for (a in syst) for (b in region) printf "sbatch --time=03:0:00 -p htc --mem=4G  --wrap \"trex-fitter n '${1}' Regions=%s:Systematics=%s:SaveSuffix=_%s_%s\"\n", region[b],syst[a],region[b],syst[a]}'


#cat $1 | egrep "^Sample: |^Region: |^Systematic: "  | awk -F ":" 'BEGIN{i=0;j=0;k=0}{gsub(/"| /,"",$2);if($1=="Sample")smpl[x++]=$2;else if($1=="Region")region[y++]=$2;else syst[z++]=$2}END{for (a in smpl) for (b in region) for (c in syst) printf "sbatch --time='$duration' -p htc --mem=4G  --wrap \"trex-fitter n '${1}' \\\"Regions=%s:Samples=%s:Systematics=%s:SaveSuffix=_%s_%s_%s \\\"\"\n", region[b],smpl[a],syst[c],region[b],smpl[a],syst[c]}'

