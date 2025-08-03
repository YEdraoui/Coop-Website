# Go to frontend and create the missing utility file
cd frontend/src/lib
cat > utils.ts << 'EOF'
import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
EOF

# Install the missing dependencies
npm install clsx tailwind-merge @heroicons/react

# Create the programs page
mkdir -p src/app/programs
cat > src/app/programs/page.tsx << 'EOF'
export default function ProgramsPage() {
  return (
    <div className="min-h-screen pt-20 px-4">
      <div className="max-w-7xl mx-auto">
        <h1 className="text-4xl font-bold text-aui-primary mb-8">Work-Based Learning Programs</h1>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="bg-white rounded-xl shadow-md p-6">
            <div className="text-3xl mb-4">🏢</div>
            <h3 className="text-xl font-bold text-aui-primary mb-2">Co-op Program</h3>
            <p className="text-gray-600 mb-4">Traditional cooperative education with leading companies. 4-6 months of hands-on experience.</p>
            <a href="/programs/coop" className="btn-primary inline-block">Learn More</a>
          </div>
          
          <div className="bg-white rounded-xl shadow-md p-6">
            <div className="text-3xl mb-4">🌍</div>
            <h3 className="text-xl font-bold text-aui-primary mb-2">Remote@AUI</h3>
            <p className="text-gray-600 mb-4">Work remotely with global companies. 3-12 months of international experience.</p>
            <a href="/programs/remote" className="btn-primary inline-block">Learn More</a>
          </div>
          
          <div className="bg-white rounded-xl shadow-md p-6">
            <div className="text-3xl mb-4">⚖️</div>
            <h3 className="text-xl font-bold text-aui-primary mb-2">Alternance</h3>
            <p className="text-gray-600 mb-4">Perfect balance of study and work. 12-24 months alternating periods.</p>
            <a href="/programs/alternance" className="btn-primary inline-block">Learn More</a>
          </div>
        </div>
      </div>
    </div>
  );
}
EOF

# Create the application page
mkdir -p src/app/students/apply
cat > src/app/students/apply/page.tsx << 'EOF'
'use client'
import { useState } from 'react';

export default function ApplyPage() {
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    program: ''
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    alert('Application submitted successfully!');
  };

  return (
    <div className="min-h-screen pt-20 px-4">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-4xl font-bold text-aui-primary mb-8">Apply for Work-Based Learning</h1>
        
        <div className="bg-white rounded-xl shadow-md p-8">
          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">First Name</label>
                <input
                  type="text"
                  required
                  value={formData.firstName}
                  onChange={(e) => setFormData({...formData, firstName: e.target.value})}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Last Name</label>
                <input
                  type="text"
                  required
                  value={formData.lastName}
                  onChange={(e) => setFormData({...formData, lastName: e.target.value})}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
                />
              </div>
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
              <input
                type="email"
                required
                value={formData.email}
                onChange={(e) => setFormData({...formData, email: e.target.value})}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
              />
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Program</label>
              <select
                required
                value={formData.program}
                onChange={(e) => setFormData({...formData, program: e.target.value})}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
              >
                <option value="">Select a Program</option>
                <option value="coop">Co-op Program</option>
                <option value="remote">Remote@AUI</option>
                <option value="alternance">Alternance</option>
              </select>
            </div>
            
            <button type="submit" className="btn-primary w-full">
              Submit Application
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}
EOF

# Create login page
mkdir -p src/app/auth/login
cat > src/app/auth/login/page.tsx << 'EOF'
'use client'
import { useState } from 'react';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Demo login
    if (email && password) {
      alert('Login successful! (Demo)');
      window.location.href = '/';
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="max-w-md w-full space-y-8">
        <div className="text-center">
          <h2 className="text-3xl font-bold text-aui-primary">Sign in to WIL.AUI</h2>
        </div>

        <div className="bg-white rounded-xl shadow-md p-8">
          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
              />
            </div>
            
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Password</label>
              <input
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
              />
            </div>
            
            <button type="submit" className="btn-primary w-full">
              Sign In
            </button>
          </form>
          
          <div className="mt-6 p-4 bg-aui-light rounded-lg">
            <h3 className="font-semibold text-aui-primary mb-2">Demo Accounts</h3>
            <div className="text-sm space-y-1">
              <div><strong>Admin:</strong> admin@aui.ma / admin123</div>
              <div><strong>Student:</strong> student@aui.ma / student123</div>
              <div><strong>Employer:</strong> employer@techcorp.ma / employer123</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
EOF

# Build the frontend
npm run build

echo "✅ Phase 4 Quick Setup Complete!"
echo "🌐 New pages available:"
echo "  • Programs: http://localhost:3000/programs"
echo "  • Apply: http://localhost:3000/students/apply"
echo "  • Login: http://localhost:3000/auth/login"
