'use client'

export default function TestimonialsSection() {
  const testimonials = [
    {
      name: 'Sarah El Mansouri',
      program: 'Co-op Program',
      year: 'Computer Science \'24',
      quote: 'The Co-op program gave me real-world experience that made me stand out. I received three job offers before graduation and felt completely prepared for my career.',
      company: 'Software Engineer at TechCorp Morocco'
    },
    {
      name: 'Ahmed Benali',
      program: 'Remote@AUI',
      year: 'Business Administration \'23',
      quote: 'Remote@AUI allowed me to work with a Silicon Valley startup while staying at AUI. The international experience was incredible and opened doors I never imagined.',
      company: 'Product Manager at Global Innovations'
    },
    {
      name: 'Lina Zerouali',
      program: 'Alternance',
      year: 'Engineering \'25',
      quote: 'The Alternance program helped me earn while I learned. I graduated debt-free with a full-time job offer and two years of professional experience.',
      company: 'Project Engineer at ONCF'
    }
  ];

  return (
    <section className="section-padding bg-aui-light">
      <div className="max-w-7xl mx-auto container-padding">
        <div className="text-center mb-16">
          <h2 className="text-heading-xl text-aui-primary mb-4">
            Success Stories
          </h2>
          <p className="text-body-lg text-brand-text-secondary">
            Hear from AUI students who transformed their careers through our programs
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {testimonials.map((testimonial, index) => (
            <div
              key={index}
              className="card p-8 hover:shadow-card-hover transition-shadow duration-300"
            >
              {/* Quote */}
              <div className="mb-6">
                <svg className="w-8 h-8 text-aui-accent mb-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clipRule="evenodd" />
                </svg>
                <p className="text-brand-text-secondary italic leading-relaxed">
                  "{testimonial.quote}"
                </p>
              </div>

              {/* Student Info */}
              <div className="border-t border-aui-gray-200 pt-6">
                <div className="flex items-center">
                  <div className="w-12 h-12 bg-gradient-primary rounded-full flex items-center justify-center text-white font-bold text-body-lg mr-4">
                    {testimonial.name.split(' ').map(n => n[0]).join('')}
                  </div>
                  <div>
                    <h4 className="font-semibold text-aui-primary">
                      {testimonial.name}
                    </h4>
                    <p className="text-body-sm text-brand-text-secondary">
                      {testimonial.year}
                    </p>
                    <p className="text-body-sm text-aui-accent font-medium">
                      {testimonial.program}
                    </p>
                  </div>
                </div>
                <div className="mt-3 text-body-sm text-brand-text-light">
                  {testimonial.company}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
