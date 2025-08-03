'use client'

export default function MetricsSection() {
  const metrics = [
    {
      number: '245+',
      label: 'Students Placed',
      description: 'Successfully matched with companies'
    },
    {
      number: '45+',
      label: 'Partner Companies',
      description: 'Leading organizations in Morocco'
    },
    {
      number: '89%',
      label: 'Job Offer Rate',
      description: 'Students receiving offers'
    },
    {
      number: '95%',
      label: 'Satisfaction Score',
      description: 'Student program satisfaction'
    }
  ];

  return (
    <section className="section-padding bg-white">
      <div className="max-w-7xl mx-auto container-padding">
        <div className="text-center mb-16">
          <h2 className="text-4xl font-bold text-aui-primary mb-4">
            Our Impact
          </h2>
          <p className="text-lg text-gray-600">
            Real results from our work-based learning programs
          </p>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          {metrics.map((metric, index) => (
            <div
              key={index}
              className="text-center group hover:scale-105 transition-transform duration-300"
            >
              <div className="card p-6 h-full">
                <div className="text-4xl font-bold text-gradient-primary mb-2">
                  {metric.number}
                </div>
                <div className="text-xl font-semibold text-aui-primary mb-2">
                  {metric.label}
                </div>
                <div className="text-sm text-gray-600">
                  {metric.description}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
