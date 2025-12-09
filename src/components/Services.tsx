import { motion } from 'motion/react';

const services = [
  {
    id: '01',
    title: 'Game Development',
    description: 'Indie games, VR experiences, PC and mobile titles that push creative boundaries.',
    items: ['Indie Games', 'VR Experiences', 'PC Gaming', 'Mobile Apps'],
  },
  {
    id: '02',
    title: 'Software Engineering',
    description: 'Custom scripts, automation tools, and web applications built with precision.',
    items: ['Open Source', 'Custom Scripts', 'Automation', 'Web Apps'],
  },
  {
    id: '03',
    title: 'Hardware Design',
    description: 'PCB design, circuit engineering, and embedded systems for innovative devices.',
    items: ['PCB Design', 'Circuits', 'Embedded Systems', 'Prototyping'],
  },
  {
    id: '04',
    title: 'CAD & Engineering',
    description: '3D modeling, product design, and technical engineering for physical products.',
    items: ['3D Modeling', 'Product Design', 'Technical Drawings', 'Devices'],
  },
];

export function Services() {
  return (
    <section className="min-h-screen px-4 py-20">
      <div className="max-w-7xl mx-auto">
        <motion.div
          className="mb-20"
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          viewport={{ once: true, margin: "-100px" }}
        >
          <div className="font-mono text-gray-600 text-sm mb-4 opacity-60 text-center">
            &#47;&#47; services.init()
          </div>
          <h2 className="text-5xl sm:text-6xl md:text-7xl text-center">
            What we do
          </h2>
        </motion.div>

        <div className="grid md:grid-cols-2 gap-8 lg:gap-12">
          {services.map((service, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.6, delay: index * 0.1 }}
              viewport={{ once: true, margin: "-50px" }}
              className="group relative p-8 border border-white/10 rounded-2xl hover:border-white/30 transition-all duration-500 bg-white/5 backdrop-blur-sm"
            >
              <div className="space-y-6">
                <div className="flex items-start justify-between">
                  <h3 className="text-3xl md:text-4xl">{service.title}</h3>
                  <span className="font-mono text-gray-600 text-sm">{service.id}</span>
                </div>
                <p className="text-gray-400 text-lg leading-relaxed">
                  {service.description}
                </p>
                <div className="flex flex-wrap gap-2 pt-4">
                  {service.items.map((item, i) => (
                    <span
                      key={i}
                      className="font-mono text-xs text-gray-500 border border-white/10 px-3 py-1 rounded-full group-hover:border-white/30 group-hover:text-gray-400 transition-colors"
                    >
                      {item}
                    </span>
                  ))}
                </div>
              </div>
              
              <div className="absolute inset-0 bg-gradient-to-br from-white/5 to-white/10 rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity duration-500 -z-10" />
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}