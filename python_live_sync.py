import os, subprocess

# Debug mode
debug = False

# Path to cloud disk
cloudPath = "/mnt/p/My Folder"

# List of directories to sync up
whatToSync = [
  { # Photography
    "diskSourceSubdir": "/mnt/f/Photography",
    "cloudDestSubdir": "Activity - Photography/Backups",
    "subdirsToSync": ["Photos", "Timelapses", "Etsy Products", "Videos", "Stock"]
  },
  { # Music
    "diskSourceSubdir": "/mnt/c/Users/obrun/Music",
    "cloudDestSubdir": "Activity - Music/Backups",
    "subdirsToSync": ["Compositions"]
  }
]

# Rsync all subdirectories
for itemToSync in whatToSync:
  for subdir in itemToSync["subdirsToSync"]:
    fullSubdirToSync = os.path.join(itemToSync["diskSourceSubdir"], subdir, "")
    if not os.path.isdir(fullSubdirToSync):
      print("Source " + fullSubdirToSync + " is not a directory")
      continue

    whereToSyncSubdir = os.path.join(cloudPath, itemToSync["cloudDestSubdir"], "Live " + subdir, "")
    if not os.path.isdir(whereToSyncSubdir):
      print("Destination " + whereToSyncSubdir + " is not a directory")
      continue

    print("Backing up " + fullSubdirToSync + " to " + whereToSyncSubdir)

    if debug:
      extraParams = "-aurhviP"
    else:
      extraParams = "-aurh"

    subprocess.call(["rsync", extraParams, "--delete", fullSubdirToSync, whereToSyncSubdir])
