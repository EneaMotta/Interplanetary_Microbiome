module load eth_proxy


#!/bin/bash
set -e

# Define paths
URL="https://polybox.ethz.ch/index.php/s/5dz6dRAPGdpX4SD/download"
TARGET_DIR="${SCRATCH}/interplanetary-metagenome_data"
ARCHIVE="${SCRATCH}/interplanetary-metagenome_data.tar.gz"

# Clean old data
rm -rf "$TARGET_DIR"

# Download archive
wget -O "$ARCHIVE" "$URL"

# Create target directory
mkdir -p "$TARGET_DIR"

# Extract contents
tar -xzf "$ARCHIVE" -C "$TARGET_DIR"

# Remove archive
rm -f "$ARCHIVE"

echo "Data imported to ${TARGET_DIR}"
