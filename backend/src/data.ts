export const programs = [
  {
    id: '1',
    name: 'Co-op Program',
    slug: 'coop',
    description: 'Traditional cooperative education with leading companies',
    duration: '4-6 months'
  },
  {
    id: '2',
    name: 'Remote@AUI',
    slug: 'remote',
    description: 'Remote work opportunities with global companies',
    duration: '3-12 months'
  },
  {
    id: '3',
    name: 'Alternance',
    slug: 'alternance',
    description: 'Work-study program alternating periods',
    duration: '12-24 months'
  }
];

export const getAllPrograms = () => programs;
export const findProgramBySlug = (slug: string) => programs.find(p => p.slug === slug);
