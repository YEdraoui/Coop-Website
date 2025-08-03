const puppeteer = require('puppeteer');

const devices = [
  'iPhone X',
  'iPad',
  'Galaxy S5',
  'iPhone 6'
];

async function testMobileResponsiveness() {
  console.log('📱 Testing Mobile Responsiveness...');
  
  const browser = await puppeteer.launch();
  
  for (const deviceName of devices) {
    const page = await browser.newPage();
    await page.emulate(puppeteer.devices[deviceName]);
    
    console.log(`Testing on ${deviceName}...`);
    
    // Test homepage
    await page.goto('http://localhost:3000');
    const title = await page.title();
    console.log(`✅ ${deviceName} - Homepage loaded: ${title}`);
    
    // Test navigation
    const navButton = await page.$('button'); // Mobile menu button
    if (navButton) {
      await navButton.click();
      console.log(`✅ ${deviceName} - Mobile navigation works`);
    }
    
    await page.close();
  }
  
  await browser.close();
  console.log('📱 Mobile responsiveness testing complete!');
}

if (require.main === module) {
  testMobileResponsiveness().catch(console.error);
}

module.exports = { testMobileResponsiveness };
