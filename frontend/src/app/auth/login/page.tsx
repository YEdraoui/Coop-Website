'use client'
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAuth } from '@/contexts/AuthContext';
import { Button } from '@/components/ui/Button';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  
  const { login } = useAuth();
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    const success = await login(email, password);
    
    if (success) {
      router.push('/students/portal');
    } else {
      setError('Invalid credentials. Try the demo accounts below.');
    }
    
    setLoading(false);
  };

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
      <div className="max-w-md w-full">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-aui-primary">Welcome to WIL.AUI</h1>
          <p className="text-gray-600 mt-2">Sign in to access your portal</p>
        </div>

        <Card>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email Address
                </label>
                <input
                  type="email"
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
                  placeholder="your.email@aui.ma"
                />
              </div>
              
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Password
                </label>
                <input
                  type="password"
                  required
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-aui-primary"
                />
              </div>

              {error && (
                <div className="text-red-600 text-sm bg-red-50 p-3 rounded-lg">
                  {error}
                </div>
              )}
              
              <Button type="submit" className="w-full" disabled={loading}>
                {loading ? 'Signing in...' : 'Sign In'}
              </Button>
            </form>
          </CardContent>
        </Card>

        {/* Demo Accounts */}
        <Card className="mt-6 border-l-4 border-aui-accent">
          <CardContent className="py-4">
            <h3 className="font-semibold text-aui-primary mb-3">Demo Accounts</h3>
            <div className="space-y-2 text-sm">
              <div className="bg-gray-50 p-2 rounded">
                <strong>Student:</strong> student@aui.ma / student123
              </div>
              <div className="bg-gray-50 p-2 rounded">
                <strong>Employer:</strong> employer@techcorp.ma / employer123
              </div>
              <div className="bg-gray-50 p-2 rounded">
                <strong>Admin:</strong> admin@aui.ma / admin123
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
