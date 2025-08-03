import BrandedNavbar from '@/components/BrandedNavbar';
import HeroSection from '@/components/HeroSection';
import ProgramCards from '@/components/ProgramCards';
import MetricsSection from '@/components/MetricsSection';
import TestimonialsSection from '@/components/TestimonialsSection';

export default function Home() {
  return (
    <>
      <BrandedNavbar />
      <main>
        <HeroSection />
        <ProgramCards />
        <MetricsSection />
        <TestimonialsSection />
      </main>
    </>
  );
}
