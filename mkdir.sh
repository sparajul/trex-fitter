#for sample in $(find "$(pwd)" -maxdepth 2 -name "*.root"); do echo sbatch -p htc --mem=6G --time=24:00:00 --wrap \'runHHMLSys --sp "${sample}"  --conf config_MC.conf --out mc16a/$(echo $sample| cut -d"/" -f7 |cut -d"." -f3)/ --mcRun mc16a\';done

for dir in user*root ; do mkdir mc16a/$(echo $dir| cut -d"/" -f3 |cut -d"." -f3); done
