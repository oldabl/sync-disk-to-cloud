import os, subprocess

# Generic parameters
dirToSyncBase = "/mnt/f/Photography"
whereToSyncBase = "/mnt/p/My Folder/Activity - Photography/Backups"

# Subdirs to sync
subdirsToSync = ["Photos", "Timelapses", "Etsy Products", "Videos", "Stock"]

# Rync all subdirectories
for subdir in subdirsToSync:
  fullSubdirToSync = os.path.join(dirToSyncBase, subdir, "")

  if not os.path.isdir(fullSubdirToSync):
    print(fullSubdirToSync + " is not a directory")
    continue

  whereToSyncSubdir = os.path.join(whereToSyncBase, "Live " + subdir, "")

  print("Backing up " + fullSubdirToSync + " to " + whereToSyncSubdir)

  subprocess.call(["rsync", "-aurhvi", "--progress", "--delete", fullSubdirToSync, whereToSyncSubdir])
