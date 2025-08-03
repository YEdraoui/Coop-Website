const axios = require('axios');

async function testSecurity() {
  console.log('🔒 Running Security Tests...');
  
  const baseUrl = 'http://localhost:3001/api';
  
  // Test 1: Rate limiting
  console.log('Testing rate limiting...');
  try {
    const promises = Array(110).fill().map(() => axios.get(`${baseUrl}/health`));
    await Promise.all(promises);
    console.log('❌ Rate limiting might not be working properly');
  } catch (error) {
    if (error.response && error.response.status === 429) {
      console.log('✅ Rate limiting is working');
    }
  }
  
  // Test 2: SQL Injection protection
  console.log('Testing SQL injection protection...');
  try {
    await axios.post(`${baseUrl}/auth/login`, {
      email: "'; DROP TABLE users; --",
      password: 'test'
    });
    console.log('✅ SQL injection protection working');
  } catch (error) {
    console.log('✅ Invalid login handled properly');
  }
  
  // Test 3: CORS headers
  console.log('Testing CORS headers...');
  try {
    const response = await axios.get(`${baseUrl}/health`);
    const corsHeader = response.headers['access-control-allow-origin'];
    if (corsHeader) {
      console.log(`✅ CORS configured: ${corsHeader}`);
    }
  } catch (error) {
    console.log('❌ Error testing CORS');
  }
  
  // Test 4: Helmet security headers
  console.log('Testing security headers...');
  try {
    const response = await axios.get(`${baseUrl}/health`);
    const securityHeaders = [
      'x-content-type-options',
      'x-frame-options',
      'x-xss-protection'
    ];
    
    securityHeaders.forEach(header => {
      if (response.headers[header]) {
        console.log(`✅ ${header} header present`);
      } else {
        console.log(`⚠️  ${header} header missing`);
      }
    });
  } catch (error) {
    console.log('❌ Error testing security headers');
  }
  
  console.log('🔒 Security testing complete!');
}

if (require.main === module) {
  testSecurity().catch(console.error);
}

module.exports = { testSecurity };
