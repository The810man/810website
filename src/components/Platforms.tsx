import { motion } from 'motion/react';
import { Github, Gamepad2, Smartphone, Cloud } from 'lucide-react';

const platforms = [
  {
    name: 'GitHub',
    icon: Github,
    url: 'https://github.com/810studios',
    description: 'Open source repositories',
    tag: 'dev',
  },
  {
    name: 'itch.io',
    icon: Gamepad2,
    url: 'https://810studios.itch.io',
    description: 'Indie game releases',
    tag: 'games',
  },
  {
    name: 'Steam',
    icon: Cloud,
    url: 'https://store.steampowered.com/search/?developer=810%20Studios',
    description: 'PC & VR games',
    tag: 'vr',
  },
  {
    name: 'Play Store',
    icon: Smartphone,
    url: 'https://play.google.com/store/apps/dev?id=810studios',
    description: 'Mobile apps',
    tag: 'mobile',
  },
];

export function Platforms() {
  return (
    <section className="min-h-screen flex items-center justify-center px-4 py-20">
      <div className="max-w-6xl mx-auto w-full">
        <motion.div
          className="mb-20"
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          viewport={{ once: true, margin: "-100px" }}
        >
          <div className="font-mono text-gray-600 text-sm mb-4 opacity-60 text-center">
            &#47;&#47; connect.sh --platforms
          </div>
          <h2 className="text-5xl sm:text-6xl md:text-7xl text-center">
            Find us
          </h2>
        </motion.div>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {platforms.map((platform, index) => {
            const Icon = platform.icon;
            return (
              <motion.a
                key={index}
                href={platform.url}
                target="_blank"
                rel="noopener noreferrer"
                initial={{ opacity: 0, y: 30 }}
                whileInView={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6, delay: index * 0.1 }}
                viewport={{ once: true, margin: "-50px" }}
                className="group relative p-8 border border-white/10 rounded-2xl hover:border-white/30 transition-all duration-500 bg-white/5 backdrop-blur-sm flex flex-col items-center text-center"
              >
                <div className="font-mono text-gray-600 text-xs mb-4">
                  ./{platform.tag}
                </div>
                <Icon className="w-12 h-12 mb-4 group-hover:scale-110 transition-transform duration-300" />
                <h3 className="text-2xl mb-2">{platform.name}</h3>
                <p className="text-gray-400 text-sm">{platform.description}</p>
                
                <div className="absolute inset-0 bg-gradient-to-br from-white/5 to-white/10 rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity duration-500 -z-10" />
              </motion.a>
            );
          })}
        </div>
      </div>
    </section>
  );
}