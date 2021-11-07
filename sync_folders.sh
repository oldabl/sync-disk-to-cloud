#Parameters
src="/Volumes/Elements1TB/Photography/Photos/"
dst="/Users/olivierdabl/pCloud Drive/Photography/Backups/Live"

[ ! -d "$src" ] && echo "Source directory '$src' does not exist" && exit 1
if [ ! -d "$dst" ]
then
  echo "Destination directory '$dst' does not exist"
  read -t 20 -p "Create this directory? (y/N) " createDirectory
  if [ "$createDirectory" = "y" ]
  then
    echo "Creating directory '$dst'"
    mkdir -p "$dst"
  else
    echo "Not creating directory, exiting"
    exit 0
  fi
fi

echo "Launching synchronisation"
rsync -aurhvi --delete --progress --bwlimit=5000 "$src" "$dst"
