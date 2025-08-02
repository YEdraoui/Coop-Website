#!/bin/bash

echo "🚀 WIL.AUI.MA Deployment Script"
echo "==============================="

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Please run this script from the wil-aui-platform root directory"
    exit 1
fi

echo "📦 Installing dependencies..."
npm run setup

echo "🏗️ Building applications..."
npm run build

echo "✅ Deployment preparation complete!"
echo ""
echo "🔗 Quick Start:"
echo "  1. Run 'npm run dev' to start development servers"
echo "  2. Visit http://localhost:3000 to see the platform"
echo "  3. API available at http://localhost:3001/api"
echo ""
echo "🔐 Test account created:"
echo "  • Admin: admin@aui.ma / admin123"
echo ""
echo "📖 See README-DEVELOPMENT.md for full documentation"
