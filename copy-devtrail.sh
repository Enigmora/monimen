#!/bin/bash
#
# copy-devtrail.sh - Copy DevTrail files to a destination folder
#
# Usage: ./copy-devtrail.sh <destination_folder>
#
# Copies all files and folders from this repository to the destination,
# excluding public repository files (README, LICENSE, etc.)

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the script's directory (repo root)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files and folders to exclude (public repo files in root)
EXCLUDES=(
    "ADOPTION-GUIDE.md"
    "CODE_OF_CONDUCT.md"
    "CONTRIBUTING.md"
    "devtrail.spdx"
    "LICENSE"
    "README.md"
    "TRANSLATION-GUIDE.md"
    "copy-devtrail.sh"
    "assets"
    "docs"
    "i18n"
)

usage() {
    echo "Usage: $0 <destination_folder>"
    echo ""
    echo "Copies DevTrail files to the specified destination folder."
    echo "Excludes public repository files: ${EXCLUDES[*]}"
    exit 1
}

# Check arguments
if [ $# -ne 1 ]; then
    echo -e "${RED}Error: Destination folder is required${NC}"
    usage
fi

DEST="$1"

# Check if rsync is available
if ! command -v rsync &> /dev/null; then
    echo -e "${RED}Error: rsync is not installed${NC}"
    echo "Please install rsync and try again."
    exit 1
fi

# Create destination if it doesn't exist
if [ ! -d "$DEST" ]; then
    echo -e "${YELLOW}Creating destination folder: $DEST${NC}"
    mkdir -p "$DEST"
fi

# Build rsync exclude arguments
EXCLUDE_ARGS=""
for item in "${EXCLUDES[@]}"; do
    EXCLUDE_ARGS="$EXCLUDE_ARGS --exclude=$item"
done

# Also exclude .git folder
EXCLUDE_ARGS="$EXCLUDE_ARGS --exclude=.git"

echo -e "${GREEN}Copying DevTrail files...${NC}"
echo "  Source: $SCRIPT_DIR"
echo "  Destination: $DEST"
echo ""

# Run rsync
# -a: archive mode (preserves permissions, timestamps, etc.)
# -v: verbose
# --progress: show progress
rsync -av --progress $EXCLUDE_ARGS "$SCRIPT_DIR/" "$DEST/"

echo ""
echo -e "${GREEN}Done! Files copied to: $DEST${NC}"
