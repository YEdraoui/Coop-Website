'use client'
import Image from 'next/image';
import { PROGRAM_INFO, openApplicationForm, type ProgramType } from '@/lib/recruitcrm';

export default function ProgramCards() {
  return (
    <section className="section-padding bg-gradient-to-br from-aui-light via-white to-aui-light">
      <div className="max-w-7xl mx-auto container-padding">
        <div className="text-center mb-20">
          <h2 className="text-5xl font-bold text-aui-primary mb-6">
            Choose Your Path
          </h2>
          <p className="text-xl text-gray-600 max-w-4xl mx-auto leading-relaxed">
            Three innovative programs designed to bridge academic learning with professional excellence. 
            Each pathway offers unique opportunities to build your career while earning your degree.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-10">
          {Object.entries(PROGRAM_INFO).map(([key, program]) => (
            <div
              key={program.id}
              className="group bg-white rounded-3xl shadow-xl hover:shadow-2xl transition-all duration-500 overflow-hidden border-2 border-gray-100 hover:border-aui-accent transform hover:-translate-y-2"
            >
              {/* Program Logo Header */}
              <div className="bg-gradient-to-br from-aui-primary to-aui-secondary p-8 text-center relative overflow-hidden">
                <div className="absolute inset-0 bg-pattern opacity-10"></div>
                <div className="relative z-10">
                  <div className="w-24 h-24 mx-auto mb-4 bg-white rounded-2xl p-4 shadow-lg">
                    <Image
                      src={program.logo}
                      alt={`${program.name} Logo`}
                      width={96}
                      height={96}
                      className="w-full h-full object-contain"
                      sizes="96px"
                    />
                  </div>
                  <h3 className="text-2xl font-bold text-white mb-2">
                    {program.name}
                  </h3>
                  <div className="text-aui-accent font-bold text-lg">
                    {program.duration}
                  </div>
                </div>
              </div>

              {/* Program Content */}
              <div className="p-8">
                <p className="text-gray-600 mb-8 leading-relaxed text-lg">
                  {program.description}
                </p>

                {/* Highlights */}
                <div className="mb-8">
                  <h4 className="font-bold text-aui-primary mb-4 text-sm uppercase tracking-wide">
                    🌟 Program Highlights
                  </h4>
                  <ul className="space-y-3">
                    {program.highlights.map((highlight, index) => (
                      <li key={index} className="flex items-start text-gray-600">
                        <span className="w-2 h-2 bg-aui-accent rounded-full mt-2.5 mr-3 flex-shrink-0"></span>
                        <span className="leading-relaxed">{highlight}</span>
                      </li>
                    ))}
                  </ul>
                </div>

                {/* Actions */}
                <div className="space-y-4">
                  <button
                    onClick={() => openApplicationForm(program.id as ProgramType)}
                    className="btn-primary w-full text-lg py-4 group-hover:shadow-xl transition-all duration-300 font-bold"
                  >
                    🚀 Apply for {program.name}
                  </button>
                  <button
                    onClick={() => window.location.href = `/programs/${program.id}`}
                    className="btn-secondary w-full text-lg py-4"
                  >
                    📖 Learn More
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Bottom CTA */}
        <div className="text-center mt-20">
          <div className="bg-gradient-to-r from-aui-primary via-aui-secondary to-aui-primary p-12 rounded-3xl text-white shadow-2xl border border-aui-accent/20">
            <h3 className="text-4xl font-bold mb-6">
              Ready to Transform Your Future?
            </h3>
            <p className="text-xl mb-8 opacity-95 max-w-3xl mx-auto leading-relaxed">
              Join over 245 AUI students who have launched successful careers through 
              our work-based learning programs. Your journey to professional excellence starts here.
            </p>
            <div className="flex flex-col sm:flex-row gap-6 justify-center">
              <button
                onClick={() => openApplicationForm('coop')}
                className="btn-accent text-xl px-10 py-4 font-bold shadow-lg hover:scale-105 transition-all duration-300"
              >
                🎯 Start Your Application
              </button>
              <button
                onClick={() => window.location.href = '/programs'}
                className="btn-outline-white text-xl px-10 py-4 font-semibold"
              >
                📋 Compare All Programs
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
