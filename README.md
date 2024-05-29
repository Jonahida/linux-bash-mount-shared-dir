# linux-bash-mount-shared-dir

This script facilitates the mounting of a shared directory, providing options to specify the directory location, remote user, and remote location. It supports both mounting and unmounting operations and allows customization of default settings through command-line arguments.

# Mount Shared Directory Script

## Description

This Bash script facilitates the mounting of a shared directory on your system. It allows customization of the directory location, remote user, and remote location, and supports both mounting and unmounting operations.

# Configuration

## Configuration Template:

1. Copy and rename `config_template.sh` to `config.sh`.

```bash
mv config_template.sh config.sh
```


2. Fill in the fields with your desired settings.

```bash
# config.sh

# Default share directory
SHARE=""

# Default remote user
REMOTE_USERNAME=""

# Default remote location
REMOTE_LOCATION=""
```


## Fill Configuration:

Open `config.sh` and provide values for the fields.


## Usage

```bash
bash mount_shared_dir.sh [-u] [-s SHARE] [-r REMOTE_USER] [-l REMOTE_LOCATION] [-h]
Options:
-u: Unmount the share instead of mounting.
-s SHARE: Specify the share directory.
-r REMOTE_USER: Specify the remote user.
-l REMOTE_LOCATION: Specify the remote location.
-h: Display help message.
```

## Example

```bash
bash mount_shared_dir.sh -s /mnt/myshare -r remoteuser -l //192.168.1.100/myshare
```
