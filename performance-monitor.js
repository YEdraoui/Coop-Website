const { exec } = require('child_process');
const fs = require('fs');

async function measurePerformance() {
  console.log('📈 Measuring Platform Performance...');
  
  const urls = [
    'http://localhost:3000',
    'http://localhost:3000/programs',
    'http://localhost:3000/students/apply',
    'http://localhost:3000/auth/login'
  ];
  
  const results = {};
  
  for (const url of urls) {
    console.log(`Testing: ${url}`);
    
    try {
      // Measure page load time
      const start = Date.now();
      const response = await fetch(url);
      const end = Date.now();
      
      results[url] = {
        loadTime: end - start,
        status: response.status,
        size: response.headers.get('content-length')
      };
      
      console.log(`✅ ${url}: ${end - start}ms`);
    } catch (error) {
      console.error(`❌ ${url}: Error - ${error.message}`);
      results[url] = { error: error.message };
    }
  }
  
  // Save results
  fs.writeFileSync('performance-results.json', JSON.stringify(results, null, 2));
  console.log('📈 Performance results saved to performance-results.json');
  
  return results;
}

if (require.main === module) {
  measurePerformance().catch(console.error);
}

module.exports = { measurePerformance };
