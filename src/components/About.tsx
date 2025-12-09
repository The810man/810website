import { motion } from 'motion/react';

export function About() {
  return (
    <section className="min-h-screen flex items-center justify-center px-4 py-20">
      <div className="max-w-6xl mx-auto">
        <motion.div
          initial={{ opacity: 0, y: 50 }}
          whileInView={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          viewport={{ once: true, margin: "-100px" }}
          className="space-y-8"
        >
          <div className="mb-12">
            <div className="font-mono text-gray-600 text-sm mb-4 opacity-60">
              &#47;&#47; About us
            </div>
            <h2 className="text-5xl sm:text-6xl md:text-7xl lg:text-8xl">
              We build the
              <br />
              <span className="text-gray-500">future</span>
            </h2>
          </div>

          <div className="grid md:grid-cols-2 gap-12 text-lg text-gray-400">
            <motion.div
              initial={{ opacity: 0, x: -30 }}
              whileInView={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.8, delay: 0.2 }}
              viewport={{ once: true }}
              className="space-y-4"
            >
              <div className="font-mono text-xs text-gray-600 mb-2">
                &#47;&#47; mission.txt
              </div>
              <p className="leading-relaxed">
                810 Studios is an independent collective pushing the boundaries of interactive experiences. 
                From immersive VR worlds to innovative mobile games, we craft experiences that captivate and inspire.
              </p>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, x: 30 }}
              whileInView={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.8, delay: 0.4 }}
              viewport={{ once: true }}
              className="space-y-4"
            >
              <div className="font-mono text-xs text-gray-600 mb-2">
                &#47;&#47; vision.txt
              </div>
              <p className="leading-relaxed">
                Beyond software, we engineer custom hardware solutions, design PCBs, and develop open-source 
                tools for the community. Everything we create is driven by innovation and shared with the world.
              </p>
            </motion.div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}