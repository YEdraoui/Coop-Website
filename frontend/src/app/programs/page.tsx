import { Card, CardContent, CardHeader } from '@/components/ui/Card';
import { Button } from '@/components/ui/Button';

const programs = [
  {
    id: 'coop',
    name: 'Co-op Program',
    description: 'Traditional cooperative education with leading companies in Morocco and internationally.',
    duration: '4-6 months',
    icon: '🏢',
    highlights: [
      'Full-time work experience',
      'Mentorship from industry professionals',
      'Networking opportunities',
      'Academic credit'
    ],
    nextDeadline: 'March 15, 2025'
  },
  {
    id: 'remote',
    name: 'Remote@AUI',
    description: 'Work remotely with global companies while maintaining your studies at AUI.',
    duration: '3-12 months',
    icon: '🌍',
    highlights: [
      'Flexible work arrangements',
      'Global company exposure',
      'Work-study balance',
      'International experience'
    ],
    nextDeadline: 'Rolling admissions'
  },
  {
    id: 'alternance',
    name: 'Alternance',
    description: 'Perfect balance of academic study and professional work experience.',
    duration: '12-24 months',
    icon: '⚖️',
    highlights: [
      'Alternating study/work periods',
      'Long-term career development',
      'Industry partnerships',
      'Degree + experience'
    ],
    nextDeadline: 'April 30, 2025'
  }
];

export default function ProgramsPage() {
  return (
    <div className="min-h-screen pt-20 px-4">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-aui-primary mb-4">
            Work-Based Learning Programs
          </h1>
          <p className="text-xl text-gray-600 max-w-3xl mx-auto">
            Choose from three innovative programs designed to bridge the gap between 
            academic learning and professional experience.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-12">
          {programs.map((program) => (
            <Card key={program.id} className="hover:shadow-lg transition-shadow">
              <CardHeader className="text-center">
                <div className="text-4xl mb-4">{program.icon}</div>
                <h3 className="text-2xl font-bold text-aui-primary">{program.name}</h3>
                <p className="text-aui-accent font-semibold">{program.duration}</p>
              </CardHeader>
              <CardContent>
                <p className="text-gray-600 mb-6">{program.description}</p>
                
                <div className="mb-6">
                  <h4 className="font-semibold mb-3">Program Highlights:</h4>
                  <ul className="space-y-2">
                    {program.highlights.map((highlight, index) => (
                      <li key={index} className="flex items-center text-sm">
                        <span className="w-2 h-2 bg-aui-accent rounded-full mr-3"></span>
                        {highlight}
                      </li>
                    ))}
                  </ul>
                </div>

                <div className="border-t pt-4">
                  <div className="text-sm text-gray-600 mb-4">
                    <strong>Next Deadline:</strong> {program.nextDeadline}
                  </div>
                  <div className="space-y-2">
                    <Button className="w-full">
                      Apply Now
                    </Button>
                    <Button variant="outline" className="w-full">
                      Learn More
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Call to Action */}
        <Card className="bg-gradient-to-r from-aui-primary to-aui-accent text-white">
          <CardContent className="text-center py-12">
            <h2 className="text-3xl font-bold mb-4">Ready to Start Your Journey?</h2>
            <p className="text-xl mb-6 opacity-90">
              Join hundreds of AUI students who have launched their careers through our programs.
            </p>
            <Button variant="outline" className="text-aui-primary bg-white hover:bg-gray-100">
              Get Started Today
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
