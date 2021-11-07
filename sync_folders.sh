# Parameters
dirToSync="/Volumes/Elements1TB/Photography/Photos/"
whereToSync="/Users/olivierdabl/pCloud Drive/Photography/Backups/Live"

# Check source directory exists
[ ! -d "$dirToSync" ] && echo "Source directory '$dirToSync' does not exist" && exit 1

# Check destination directory exists
if [ ! -d "$whereToSync" ]
then
  echo "Destination directory '$whereToSync' does not exist"
  read -t 20 -p "Create this directory? (y/N) " createDirectory
  if [ "$createDirectory" = "y" ]
  then
    echo "Creating directory '$whereToSync'"
    mkdir -p "$whereToSync"
  else
    echo "Not creating directory, exiting"
    exit 0
  fi
fi

# Launch synchronisation
rsync -aurhvi --delete --progress --bwlimit=5000 "$dirToSync" "$whereToSync"
