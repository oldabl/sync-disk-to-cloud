src="/Volumes/Elements1TB/Photography/Photos/"
dst="/Users/olivierdabl/pCloud Drive/Photography/Backups/Live"

mkdir -p "$dst"
rsync -aurhvi --delete --progress --bwlimit=5000 "$src" "$dst"
