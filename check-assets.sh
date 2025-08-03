#!/bin/bash

# Asset Checker Script for WIL.AUI.MA
# Run this to verify all logos are correctly placed

echo "🎨 WIL.AUI.MA - Asset Placement Checker"
echo "======================================"

cd ~/Desktop/E+E\ Website/wil-aui-platform

# Check if main project directory exists
if [ ! -d "public_assets" ]; then
    echo "❌ Error: public_assets directory not found!"
    echo "   Make sure you're in the wil-aui-platform directory"
    exit 1
fi

echo "📁 Checking folder structure..."
echo ""

# Define required assets
declare -A REQUIRED_ASSETS=(
    ["AUI Main Logo"]="public_assets/branding/aui/aui-logo.png"
    ["WIL Office Logo"]="public_assets/branding/office/wil-office-logo.png"
    ["Co-op Program Logo"]="public_assets/branding/programs/coop-logo.png"
    ["Remote@AUI Program Logo"]="public_assets/branding/programs/remote-logo.png"
    ["Alternance Program Logo"]="public_assets/branding/programs/alternance-logo.png"
)

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

FOUND_COUNT=0
TOTAL_COUNT=${#REQUIRED_ASSETS[@]}

echo -e "${BLUE}📋 Required Assets Checklist:${NC}"
echo "================================="

# Check each required asset
for asset_name in "${!REQUIRED_ASSETS[@]}"; do
    asset_path="${REQUIRED_ASSETS[$asset_name]}"
    
    if [ -f "$asset_path" ]; then
        # Get file size in a readable format
        file_size=$(ls -lh "$asset_path" | awk '{print $5}')
        echo -e "✅ ${GREEN}$asset_name${NC}"
        echo -e "   📄 Path: $asset_path"
        echo -e "   📊 Size: $file_size"
        ((FOUND_COUNT++))
    else
        echo -e "❌ ${RED}$asset_name${NC}"
        echo -e "   📄 Expected: $asset_path"
        echo -e "   ⚠️  Status: FILE NOT FOUND"
    fi
    echo ""
done

echo "================================="
echo -e "${BLUE}📊 Summary:${NC}"
echo -e "   Found: ${GREEN}$FOUND_COUNT${NC}/$TOTAL_COUNT assets"

if [ $FOUND_COUNT -eq $TOTAL_COUNT ]; then
    echo -e "   Status: ${GREEN}✅ ALL ASSETS READY!${NC}"
    echo ""
    echo -e "${GREEN}🚀 Ready for Phase 2!${NC}"
    echo "   Run Phase 2 to integrate all logos into the website"
else
    echo -e "   Status: ${YELLOW}⚠️  MISSING ASSETS${NC}"
    echo ""
    echo -e "${YELLOW}📋 Next Steps:${NC}"
    echo "   1. Add the missing PNG files to the correct folders"
    echo "   2. Use exact filenames shown above"
    echo "   3. Run this script again to verify"
fi

echo ""
echo "================================="
echo -e "${BLUE}📁 Current Folder Contents:${NC}"
echo ""

# Show what's actually in each folder
for folder in "public_assets/branding/aui" "public_assets/branding/office" "public_assets/branding/programs"; do
    if [ -d "$folder" ]; then
        echo -e "${BLUE}📂 $folder:${NC}"
        files=$(ls -la "$folder" 2>/dev/null | grep -E '\.(png|jpg|svg)$' | awk '{print $9}' | head -10)
        if [ -n "$files" ]; then
            echo "$files" | while read file; do
                if [ -n "$file" ]; then
                    echo "   📄 $file"
                fi
            done
        else
            echo "   (empty)"
        fi
        echo ""
    fi
done

echo "================================="
echo -e "${BLUE}💡 Need Help?${NC}"
echo ""
echo "To add a logo:"
echo "1. Copy your PNG file to the Mac"
echo "2. Rename it to the exact name shown above"
echo "3. Move it to the correct folder"
echo ""
echo "Example commands:"
echo "# Copy AUI logo"
echo "cp ~/Desktop/your-aui-logo.png ~/Desktop/E+E\\ Website/wil-aui-platform/public_assets/branding/aui/aui-logo.png"
echo ""
echo "# Copy program logos"  
echo "cp ~/Desktop/your-coop-logo.png ~/Desktop/E+E\\ Website/wil-aui-platform/public_assets/branding/programs/coop-logo.png"
echo ""
echo "Then run this script again: ./check-assets.sh"
