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
suffix=`date +"%Y%m%d%H%M%S"`
dirname=`basename "$dirToBackup"`
backupName="$dirname$suffix.zip"
zip -r "$backupName" "$dirToBackup"
mv "$backupName" "$whereToStoreBackup"
