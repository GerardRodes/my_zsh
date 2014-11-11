repos=("sirio" "procyon-ng" "polaris")
basepath="/Users/juanma/Sites/dev/repo/"
for x in $repos; do
	cd $basepath$x && git fetch
done
