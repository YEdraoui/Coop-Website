const { exec } = require('child_process');
const fs = require('fs');

const urls = [
  'http://localhost:3000',
  'http://localhost:3000/programs',
  'http://localhost:3000/students/apply',
  'http://localhost:3000/auth/login'
];

async function testAccessibility() {
  console.log('🔍 Running Accessibility Tests...');
  
  for (const url of urls) {
    console.log(`Testing: ${url}`);
    
    // Use axe-core CLI for accessibility testing
    exec(`npx axe-cli ${url}`, (error, stdout, stderr) => {
      if (error) {
        console.error(`Accessibility issues found for ${url}:`, stderr);
      } else {
        console.log(`✅ ${url} passed accessibility tests`);
      }
    });
  }
}

if (require.main === module) {
  testAccessibility();
}

module.exports = { testAccessibility };
