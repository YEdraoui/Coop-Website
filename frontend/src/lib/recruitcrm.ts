// RecruitCRM Integration for WIL.AUI.MA
// All applications redirect to external RecruitCRM form

const RECRUITCRM_BASE_URL = 'https://websites.recruitcrm.io/40820761-d057-4a43-a0ea-035caec9ef2c';

export type ProgramType = 'coop' | 'remote' | 'alternance';

export function getApplyUrl(program: ProgramType): string {
  return `${RECRUITCRM_BASE_URL}?program=${program}&utm_source=wil.aui.ma&utm_medium=cta&utm_campaign=program_apply`;
}

export function openApplicationForm(program: ProgramType): void {
  const url = getApplyUrl(program);
  window.open(url, '_blank', 'noopener,noreferrer');
}

export const PROGRAM_INFO = {
  coop: {
    id: 'coop',
    name: 'Co-op Program',
    title: 'Cooperative Education',
    description: 'Traditional cooperative education with leading companies in Morocco and internationally. Gain 4-6 months of hands-on professional experience.',
    duration: '4-6 months',
    type: 'Full-time work experience',
    logo: '/branding/programs/coop-logo.png',
    highlights: [
      'Full-time work experience with partner companies',
      'Mentorship from industry professionals',
      'Academic credit and career development',
      'Networking opportunities in your field'
    ]
  },
  remote: {
    id: 'remote',
    name: 'Remote@AUI',
    title: 'Remote Work Program',
    description: 'Work remotely with global companies while maintaining your studies at AUI. Experience international work culture and digital collaboration.',
    duration: '3-12 months',
    type: 'Flexible remote work',
    logo: '/branding/programs/remote-logo.png',
    highlights: [
      'Flexible work arrangements with global companies',
      'International experience and cultural exposure',
      'Work-study balance optimization',
      'Digital skills and remote collaboration mastery'
    ]
  },
  alternance: {
    id: 'alternance',
    name: 'Alternance',
    title: 'Work-Study Program',
    description: 'Perfect balance of academic study and professional work experience. Alternate between classroom learning and workplace application.',
    duration: '12-24 months',
    type: 'Alternating study/work periods',
    logo: '/branding/programs/alternance-logo.png',
    highlights: [
      'Alternating periods of study and work',
      'Long-term career development pathway',
      'Strong industry partnerships across Morocco',
      'Degree completion with professional experience'
    ]
  }
} as const;
