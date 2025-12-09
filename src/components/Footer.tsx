export function Footer() {
  return (
    <footer className="border-t border-white/10 py-12 px-4">
      <div className="max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-center gap-4">
        <div className="text-gray-500">
          <span className="font-mono text-gray-600 text-sm">© </span>
          2025 810 Studios
        </div>
        <div className="flex items-center gap-4 text-gray-500 text-sm">
          <span className="font-mono text-gray-600">&#47;&#47;</span>
          <span>Open Source</span>
          <span className="text-white/20">•</span>
          <span>Independent</span>
          <span className="text-white/20">•</span>
          <span>Innovative</span>
        </div>
      </div>
    </footer>
  );
}