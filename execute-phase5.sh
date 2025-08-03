#!/bin/bash

echo "🧪 Executing Phase 5: Complete Testing & QA"
echo "==========================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    case $2 in
        "success") echo -e "${GREEN}✅ $1${NC}" ;;
        "error") echo -e "${RED}❌ $1${NC}" ;;
        "warning") echo -e "${YELLOW}⚠️  $1${NC}" ;;
        "info") echo -e "${BLUE}ℹ️  $1${NC}" ;;
        *) echo "$1" ;;
    esac
}

# Check if servers are running
check_servers() {
    print_status "Checking if servers are running..." "info"
    
    # Check frontend
    if curl -s http://localhost:3000 > /dev/null; then
        print_status "Frontend server is running on port 3000" "success"
    else
        print_status "Frontend server is not running. Please start with 'npm run dev'" "error"
        exit 1
    fi
    
    # Check backend
    if curl -s http://localhost:3001/api/health > /dev/null; then
        print_status "Backend server is running on port 3001" "success"
    else
        print_status "Backend server is not running. Please start with 'npm run dev'" "error"
        exit 1
    fi
}

# Run tests
run_tests() {
    print_status "Running comprehensive test suite..." "info"
    
    # Frontend tests
    print_status "Running frontend tests..." "info"
    cd frontend
    npm test -- --watchAll=false --coverage
    
    # Backend tests
    print_status "Running backend tests..." "info"
    cd ../backend
    npm test -- --coverage
    
    # ESLint
    print_status "Running code quality checks..." "info"
    cd ../frontend
    npm run lint
    
    # Build test
    print_status "Testing production build..." "info"
    npm run build
    
    cd ..
}

# Main execution
main() {
    print_status "Phase 5: Complete Testing & QA Starting..." "info"
    
    check_servers
    run_tests
    
    print_status "Running security tests..." "info"
    node test-security.js
    
    print_status "Running performance tests..." "info"
    node performance-monitor.js
    
    print_status "Phase 5 Testing Complete!" "success"
    print_status "Check QA-CHECKLIST.md for manual testing items" "info"
    print_status "Ready for Phase 6: Launch & Deployment" "success"
}

# Execute if run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
