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
