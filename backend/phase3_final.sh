# Check what's in the dist folder
ls -la dist/

# Check if data.js was created
ls -la src/

# The issue is TypeScript isn't compiling .js files, only .ts files
# Let's rename it to .ts so TypeScript compiles it
mv src/data.js src/data.ts

# Update the data.ts file with proper TypeScript syntax
cat > src/data.ts << 'EOF'
export const programs = [
  {
    id: '1',
    name: 'Co-op Program',
    slug: 'coop',
    description: 'Traditional cooperative education with leading companies',
    duration: '4-6 months'
  },
  {
    id: '2',
    name: 'Remote@AUI',
    slug: 'remote',
    description: 'Remote work opportunities with global companies',
    duration: '3-12 months'
  },
  {
    id: '3',
    name: 'Alternance',
    slug: 'alternance',
    description: 'Work-study program alternating periods',
    duration: '12-24 months'
  }
];

export const getAllPrograms = () => programs;
export const findProgramBySlug = (slug: string) => programs.find(p => p.slug === slug);
EOF

# Update server.ts to use ES6 imports instead of require
cat > src/server.ts << 'EOF'
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
const morgan = require('morgan');
const compression = require('compression');
import rateLimit from 'express-rate-limit';
import dotenv from 'dotenv';
import { getAllPrograms, findProgramBySlug } from './data';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(helmet());
app.use(compression());

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: 'Too many requests from this IP, please try again later.',
});
app.use('/api/', limiter);

app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:3000',
  credentials: true,
}));

app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));
app.use(morgan('combined'));

app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    message: 'WIL.AUI.MA API is running successfully'
  });
});

app.get('/api/programs', (req, res) => {
  try {
    const programs = getAllPrograms();
    res.json({ 
      success: true,
      programs,
      count: programs.length
    });
  } catch (error) {
    res.status(500).json({ success: false, message: 'Error fetching programs' });
  }
});

app.get('/api/programs/:slug', (req, res) => {
  try {
    const { slug } = req.params;
    const program = findProgramBySlug(slug);
    
    if (!program) {
      return res.status(404).json({ success: false, message: 'Program not found' });
    }
    
    res.json({ 
      success: true,
      program
    });
  } catch (error) {
    res.status(500).json({ success: false, message: 'Error fetching program' });
  }
});

app.post('/api/contact', (req, res) => {
  const { name, email, subject, message } = req.body;
  
  if (!name || !email || !subject || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'All fields are required' 
    });
  }
  
  console.log('📧 Contact Form:', { name, email, subject, message });
  
  res.status(201).json({
    success: true,
    message: 'Contact form submitted successfully',
    id: Date.now().toString(),
  });
});

app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: `Route ${req.originalUrl} not found`,
  });
});

app.listen(PORT, () => {
  console.log('🚀 Server running on port', PORT);
  console.log('📍 Environment:', process.env.NODE_ENV);
  console.log('🔗 API Base URL: http://localhost:' + PORT + '/api');
  console.log('✅ Backend is working!');
});

export default app;
EOF

# Rebuild with the new TypeScript files
npm run build

# Check that data.js was compiled
ls -la dist/

# Start the server
npm start &

# Wait and test
sleep 3
curl http://localhost:3001/api/health
