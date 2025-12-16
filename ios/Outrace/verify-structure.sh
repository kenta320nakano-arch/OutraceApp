#!/bin/bash

# Outrace iOS Project Structure Verification Script
# This script checks that all expected files are present

echo "🔍 Verifying Outrace iOS Project Structure..."
echo ""

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ERRORS=0

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a file exists
check_file() {
    if [ -f "$PROJECT_DIR/$1" ]; then
        echo -e "${GREEN}✓${NC} $1"
        return 0
    else
        echo -e "${RED}✗${NC} $1 ${RED}(MISSING)${NC}"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

# Function to check if a directory exists
check_dir() {
    if [ -d "$PROJECT_DIR/$1" ]; then
        echo -e "${GREEN}✓${NC} $1/"
        return 0
    else
        echo -e "${RED}✗${NC} $1/ ${RED}(MISSING)${NC}"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

echo "📁 Checking Directories..."
check_dir "Sources/App"
check_dir "Sources/Screens"
check_dir "Sources/Models"
check_dir "Sources/Services"
check_dir "Sources/Components"
check_dir "Sources/Utils"
check_dir "Resources/Assets.xcassets"
check_dir "Outrace.xcodeproj"

echo ""
echo "📄 Checking App Files..."
check_file "Sources/App/OutraceApp.swift"
check_file "Sources/App/AppTheme.swift"

echo ""
echo "📱 Checking Screen Files..."
check_file "Sources/Screens/HomeView.swift"
check_file "Sources/Screens/PostView.swift"
check_file "Sources/Screens/ArchiveView.swift"
check_file "Sources/Screens/ProfileView.swift"

echo ""
echo "📦 Checking Model Files..."
check_file "Sources/Models/Post.swift"
check_file "Sources/Models/User.swift"

echo ""
echo "🔧 Checking Service Files..."
check_file "Sources/Services/AuthService.swift"
check_file "Sources/Services/PostService.swift"
check_file "Sources/Services/StorageService.swift"

echo ""
echo "🎨 Checking Component Files..."
check_file "Sources/Components/PostCard.swift"
check_file "Sources/Components/SimpleButton.swift"
check_file "Sources/Components/LightPostInput.swift"

echo ""
echo "⚙️  Checking Utility Files..."
check_file "Sources/Utils/Constants.swift"
check_file "Sources/Utils/DateUtils.swift"

echo ""
echo "🎨 Checking Resources..."
check_file "Resources/Assets.xcassets/Contents.json"
check_file "Resources/Assets.xcassets/AppIcon.appiconset/Contents.json"
check_file "Resources/Assets.xcassets/PrimaryGreen.colorset/Contents.json"
check_file "Resources/Assets.xcassets/SkyBlue.colorset/Contents.json"
check_file "Resources/Assets.xcassets/EarthBrown.colorset/Contents.json"
check_file "Resources/Assets.xcassets/BackgroundNeutral.colorset/Contents.json"

echo ""
echo "⚙️  Checking Configuration Files..."
check_file "Info.plist"
check_file "Outrace.xcodeproj/project.pbxproj"
check_file "README.md"

echo ""
echo "=================================="
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed! Project structure is complete.${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Open Outrace.xcodeproj in Xcode"
    echo "2. Configure Signing & Capabilities"
    echo "3. Select a simulator or device"
    echo "4. Press ⌘R to build and run"
else
    echo -e "${RED}❌ Found $ERRORS missing files or directories.${NC}"
    echo "Please review the errors above."
    exit 1
fi
