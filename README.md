# These scripts allow to sync or create backups

## Live sync
Originally made to sync a directory between an external volume (Elements1TB) to an online disk (in this default case pCloud), its bandwith is limited to make sure pCloud has time to upload files while they are being copied into it.
### Prerequisites
Need to have rsync installed.
### Parameters
The parameters are set directly inside the script:
- dirToSync: source directory to synchronise
- whereToSync: destination directory where to synchronise the source directory
### Details
It replicates exactly the dirToSync directory, meaning:
- the first run can take hours because it needs to copy the whole directory
- subsequent runs will only do what's needed to make sure the destination directory is up-to-date with the source
- if a file is deleted in the source directory, the script will delete it in the destination directory
- if a file is updated in the source directory, the script will copy the newly updated file into the destination directory
- if a file is updated in the destination directory, the script won't replace it with the file in the source directory

## One-time sync
It creates a zip archive of the dirToBackup directory and stores it in the whereToBackup directory.
### Prerequisites
Need to have zip installed.
### Parameters
The parameters are set directly inside the script:
- dirToBackup: source directory to archive as backup
- whereToStoreBackup: destination directory where to store the backup archive
