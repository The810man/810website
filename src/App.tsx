import { Hero } from './components/Hero';
import { About } from './components/About';
import { Services } from './components/Services';
import { Platforms } from './components/Platforms';
import { Footer } from './components/Footer';
import { BackgroundAnimation } from './components/BackgroundAnimation';

export default function App() {
  return (
    <div className="bg-black text-white relative">
      <BackgroundAnimation />
      <div className="relative z-10">
        <Hero />
        <About />
        <Services />
        <Platforms />
        <Footer />
      </div>
    </div>
  );
}
