'use client'
import { useAuth } from '@/contexts/AuthContext';
import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { Button } from '@/components/ui/Button';

export default function StudentPortal() {
  const { user, logout } = useAuth();

  if (!user) {
    return (
      <div className="min-h-screen pt-20 px-4 flex items-center justify-center">
        <Card>
          <CardContent className="text-center py-8">
            <h2 className="text-xl font-semibold mb-4">Please log in to access your portal</h2>
            <Button onClick={() => window.location.href = '/auth/login'}>
              Go to Login
            </Button>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="min-h-screen pt-20 px-4">
      <div className="max-w-7xl mx-auto">
        <div className="flex justify-between items-center mb-8">
          <div>
            <h1 className="text-3xl font-bold text-aui-primary">Student Portal</h1>
            <p className="text-gray-600">Welcome back, {user.name}!</p>
          </div>
          <Button variant="outline" onClick={logout}>
            Logout
          </Button>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* Quick Actions */}
          <Card>
            <CardHeader>
              <h3 className="text-lg font-semibold">Quick Actions</h3>
            </CardHeader>
            <CardContent className="space-y-3">
              <Button className="w-full" onClick={() => window.location.href = '/students/apply'}>
                📝 Apply to Program
              </Button>
              <Button variant="outline" className="w-full">
                📋 View Applications
              </Button>
              <Button variant="outline" className="w-full">
                👤 Update Profile
              </Button>
            </CardContent>
          </Card>

          {/* Applications Status */}
          <Card>
            <CardHeader>
              <h3 className="text-lg font-semibold">My Applications</h3>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                <div className="flex justify-between items-center p-3 bg-yellow-50 rounded-lg">
                  <div>
                    <div className="font-medium">Co-op Program</div>
                    <div className="text-sm text-gray-600">Applied: Jan 15, 2025</div>
                  </div>
                  <span className="px-2 py-1 bg-yellow-200 text-yellow-800 text-xs rounded">
                    Under Review
                  </span>
                </div>
                
                <div className="flex justify-between items-center p-3 bg-green-50 rounded-lg">
                  <div>
                    <div className="font-medium">Remote@AUI</div>
                    <div className="text-sm text-gray-600">Applied: Dec 20, 2024</div>
                  </div>
                  <span className="px-2 py-1 bg-green-200 text-green-800 text-xs rounded">
                    Accepted
                  </span>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Recommended Opportunities */}
          <Card>
            <CardHeader>
              <h3 className="text-lg font-semibold">Recommended for You</h3>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                <div className="p-3 border border-gray-200 rounded-lg">
                  <div className="font-medium">Software Engineer Intern</div>
                  <div className="text-sm text-gray-600">TechCorp Morocco</div>
                  <div className="text-xs text-aui-primary mt-1">Remote@AUI Program</div>
                </div>
                
                <div className="p-3 border border-gray-200 rounded-lg">
                  <div className="font-medium">Data Analyst Co-op</div>
                  <div className="text-sm text-gray-600">Banque Populaire</div>
                  <div className="text-xs text-aui-primary mt-1">Co-op Program</div>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Recent Activity */}
        <Card className="mt-6">
          <CardHeader>
            <h3 className="text-lg font-semibold">Recent Activity</h3>
          </CardHeader>
          <CardContent>
            <div className="space-y-3">
              <div className="flex items-center space-x-3 p-3 bg-blue-50 rounded-lg">
                <div className="w-2 h-2 bg-blue-500 rounded-full"></div>
                <div>
                  <div className="font-medium">Application Status Updated</div>
                  <div className="text-sm text-gray-600">Your Remote@AUI application has been accepted! Check your email for next steps.</div>
                  <div className="text-xs text-gray-500">2 hours ago</div>
                </div>
              </div>
              
              <div className="flex items-center space-x-3 p-3 bg-gray-50 rounded-lg">
                <div className="w-2 h-2 bg-gray-400 rounded-full"></div>
                <div>
                  <div className="font-medium">New Opportunity Posted</div>
                  <div className="text-sm text-gray-600">TechCorp Morocco posted a new Software Engineer position.</div>
                  <div className="text-xs text-gray-500">1 day ago</div>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
