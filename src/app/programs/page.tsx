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
