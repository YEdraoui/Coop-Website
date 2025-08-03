export default function NotFound() {
  return (
    <main className="min-h-screen grid place-items-center bg-gray-50 px-4">
      <div className="text-center">
        <h1 className="text-5xl font-bold mb-2">404</h1>
        <p className="text-gray-600 mb-6">The page you’re looking for doesn’t exist.</p>
        <a href="/" className="inline-block bg-blue-700 text-white px-6 py-3 rounded-lg">Go Home</a>
      </div>
    </main>
  );
}
