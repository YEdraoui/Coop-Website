export default function Home() {
  return (
    <main className="min-h-screen">
      {/* Hero Section */}
      <section className="min-h-screen flex items-center justify-center bg-gradient-to-br from-aui-primary to-aui-accent text-white">
        <div className="max-w-4xl mx-auto px-4 text-center">
          <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">
            Bridging Academia and Industry
          </h1>
          <p className="text-xl md:text-2xl text-white/90 mb-8">
            Connect with leading companies through our Co-op, Remote@AUI, and Alternance programs.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="/programs" className="btn-secondary">
              Explore Programs
            </a>
            <a href="/employers" className="btn-outline text-white border-white hover:bg-white hover:text-aui-primary">
              Partner With Us
            </a>
          </div>
        </div>
      </section>

      {/* Programs Section */}
      <section className="py-20 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-aui-primary mb-4">
              Choose Your Path
            </h2>
            <p className="text-xl text-gray-600">
              Three distinct programs designed to match your career goals.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {/* Co-op Program */}
            <div className="card text-center">
              <div className="w-16 h-16 bg-aui-light rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-2xl">🏢</span>
              </div>
              <h3 className="text-xl font-bold text-aui-primary mb-3">Co-op Program</h3>
              <p className="text-gray-600 mb-4">
                Traditional cooperative education with leading companies. 4-6 months of hands-on experience.
              </p>
              <span className="inline-block bg-aui-light text-aui-primary px-3 py-1 rounded-full text-sm font-semibold mb-4">
                4-6 Months
              </span>
              <br />
              <a href="/programs/coop" className="btn-primary">Learn More</a>
            </div>

            {/* Remote@AUI */}
            <div className="card text-center">
              <div className="w-16 h-16 bg-aui-light rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-2xl">🌍</span>
              </div>
              <h3 className="text-xl font-bold text-aui-primary mb-3">Remote@AUI</h3>
              <p className="text-gray-600 mb-4">
                Work remotely with global companies. 3-12 months of international experience.
              </p>
              <span className="inline-block bg-aui-light text-aui-primary px-3 py-1 rounded-full text-sm font-semibold mb-4">
                3-12 Months
              </span>
              <br />
              <a href="/programs/remote" className="btn-primary">Learn More</a>
            </div>

            {/* Alternance */}
            <div className="card text-center">
              <div className="w-16 h-16 bg-aui-light rounded-full flex items-center justify-center mx-auto mb-4">
                <span className="text-2xl">⚖️</span>
              </div>
              <h3 className="text-xl font-bold text-aui-primary mb-3">Alternance</h3>
              <p className="text-gray-600 mb-4">
                Perfect balance of study and work. 12-24 months alternating periods.
              </p>
              <span className="inline-block bg-aui-light text-aui-primary px-3 py-1 rounded-full text-sm font-semibold mb-4">
                12-24 Months
              </span>
              <br />
              <a href="/programs/alternance" className="btn-primary">Learn More</a>
            </div>
          </div>
        </div>
      </section>

      {/* Metrics Section */}
      <section className="py-20 bg-aui-primary text-white">
        <div className="max-w-7xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold mb-4">
              Impact by the Numbers
            </h2>
            <p className="text-xl text-white/90">
              Our programs deliver measurable results for students and employers.
            </p>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div className="text-center">
              <div className="text-4xl md:text-5xl font-bold text-aui-secondary mb-2">250+</div>
              <div className="text-lg text-white/90">Students Placed</div>
            </div>
            <div className="text-center">
              <div className="text-4xl md:text-5xl font-bold text-aui-secondary mb-2">45+</div>
              <div className="text-lg text-white/90">Partner Companies</div>
            </div>
            <div className="text-center">
              <div className="text-4xl md:text-5xl font-bold text-aui-secondary mb-2">85%</div>
              <div className="text-lg text-white/90">Employment Rate</div>
            </div>
            <div className="text-center">
              <div className="text-4xl md:text-5xl font-bold text-aui-secondary mb-2">12K</div>
              <div className="text-lg text-white/90">Avg. Salary (MAD)</div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-aui-accent text-white">
        <div className="max-w-4xl mx-auto px-4 text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">
            Ready to Start Your Journey?
          </h2>
          <p className="text-xl text-white/90 mb-8">
            Join hundreds of AUI students who have launched their careers through our programs.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a href="/students/apply" className="btn-secondary">
              Apply Now
            </a>
            <a href="/programs" className="btn-outline text-white border-white hover:bg-white hover:text-aui-accent">
              View All Programs
            </a>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-16">
        <div className="max-w-7xl mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
              <h4 className="text-aui-secondary font-semibold mb-4">Programs</h4>
              <ul className="space-y-2">
                <li><a href="/programs/coop" className="text-gray-300 hover:text-aui-secondary">Co-op Program</a></li>
                <li><a href="/programs/remote" className="text-gray-300 hover:text-aui-secondary">Remote@AUI</a></li>
                <li><a href="/programs/alternance" className="text-gray-300 hover:text-aui-secondary">Alternance</a></li>
              </ul>
            </div>
            <div>
              <h4 className="text-aui-secondary font-semibold mb-4">For Students</h4>
              <ul className="space-y-2">
                <li><a href="/students/apply" className="text-gray-300 hover:text-aui-secondary">How to Apply</a></li>
                <li><a href="/students/portal" className="text-gray-300 hover:text-aui-secondary">Student Portal</a></li>
                <li><a href="/students/stories" className="text-gray-300 hover:text-aui-secondary">Success Stories</a></li>
              </ul>
            </div>
            <div>
              <h4 className="text-aui-secondary font-semibold mb-4">For Employers</h4>
              <ul className="space-y-2">
                <li><a href="/employers/partnership" className="text-gray-300 hover:text-aui-secondary">Partner With Us</a></li>
                <li><a href="/employers/portal" className="text-gray-300 hover:text-aui-secondary">Employer Portal</a></li>
                <li><a href="/impact" className="text-gray-300 hover:text-aui-secondary">Program Impact</a></li>
              </ul>
            </div>
            <div>
              <h4 className="text-aui-secondary font-semibold mb-4">Contact</h4>
              <ul className="space-y-2">
                <li><a href="mailto:wil@aui.ma" className="text-gray-300 hover:text-aui-secondary">wil@aui.ma</a></li>
                <li><a href="tel:+212535269000" className="text-gray-300 hover:text-aui-secondary">+212 5 35 26 90 00</a></li>
                <li><a href="/resources/contact" className="text-gray-300 hover:text-aui-secondary">Get in Touch</a></li>
              </ul>
            </div>
          </div>
          <div className="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2025 Al Akhawayn University. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </main>
  )
}
