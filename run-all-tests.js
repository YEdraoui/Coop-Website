#!/usr/bin/env node

const { exec } = require('child_process');
const { promisify } = require('util');
const execAsync = promisify(exec);

async function runCommand(command, description) {
  console.log(`\n🚀 ${description}...`);
  try {
    const { stdout, stderr } = await execAsync(command);
    if (stdout) console.log(stdout);
    if (stderr) console.warn(stderr);
    console.log(`✅ ${description} completed`);
    return true;
  } catch (error) {
    console.error(`❌ ${description} failed:`, error.message);
    return false;
  }
}

async function runAllTests() {
  console.log('🧪 WIL.AUI.MA - Phase 5: Complete Testing & QA Suite');
  console.log('==================================================\n');
  
  const results = {
    frontendTests: false,
    backendTests: false,
    e2eTests: false,
    linting: false,
    formatting: false,
    build: false
  };
  
  // Frontend Unit Tests
  results.frontendTests = await runCommand(
    'cd frontend && npm test -- --watchAll=false --coverage',
    'Frontend Unit Tests'
  );
  
  // Backend Unit Tests
  results.backendTests = await runCommand(
    'cd backend && npm test -- --coverage',
    'Backend Unit Tests'
  );
  
  // ESLint
  results.linting = await runCommand(
    'cd frontend && npx eslint src --ext .ts,.tsx',
    'ESLint Code Quality Check'
  );
  
  // Prettier
  results.formatting = await runCommand(
    'cd frontend && npx prettier --check src',
    'Prettier Code Formatting Check'
  );
  
  // Build Tests
  results.build = await runCommand(
    'cd frontend && npm run build',
    'Production Build Test'
  );
  
  // Summary
  console.log('\n📊 TEST RESULTS SUMMARY');
  console.log('========================');
  
  Object.entries(results).forEach(([test, passed]) => {
    const status = passed ? '✅ PASSED' : '❌ FAILED';
    console.log(`${test.padEnd(20)} ${status}`);
  });
  
  const passedTests = Object.values(results).filter(Boolean).length;
  const totalTests = Object.values(results).length;
  
  console.log(`\n🎯 Overall: ${passedTests}/${totalTests} tests passed`);
  
  if (passedTests === totalTests) {
    console.log('\n🎉 ALL TESTS PASSED! Phase 5 Complete!');
    console.log('Ready for Phase 6: Launch & Deployment');
  } else {
    console.log('\n⚠️  Some tests failed. Review output above.');
  }
}

if (require.main === module) {
  runAllTests().catch(console.error);
}

module.exports = { runAllTests };
