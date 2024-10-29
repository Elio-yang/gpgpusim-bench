for currDir in *
do
    if [ -d $currDir ]
    then
        echo $currDir
    	cd $currDir
    	pwd
    	make $1 clean
    	make $1
    	cd ..
    fi
done
