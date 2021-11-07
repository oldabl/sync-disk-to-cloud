# Parameters
dirToBackup="/Volumes/Elements1TB/Photography/Photos/"
whereToStoreBackup="/Users/olivierdabl/pCloud Drive/Photography/Backups/"

# Check source directory exists
[ ! -d "$dirToBackup" ] && echo "Source directory '$dirToBackup' does not exist" && exit 1

# Check destination directory exists
if [ ! -d "$whereToStoreBackup" ]
then
  echo "Destination directory '$whereToStoreBackup' does not exist"
  read -t 20 -p "Create this directory? (y/N) " createDirectory
  if [ "$createDirectory" = "y" ]
  then
    echo "Creating directory '$whereToStoreBackup'"
    mkdir -p "$whereToStoreBackup"
  else
    echo "Not creating directory, exiting"
    exit 0
  fi
fi

# Create archive to back up
dirName=`date +"%Y%m%d%H%M%S"`
mkdir -p "$whereToStoreBackup/$dirName"
zipName=`basename "$dirToBackup"`
output="$zipName.zip"
zip -rv -s 100m "$whereToStoreBackup/$dirName/$output" "$dirToBackup"
