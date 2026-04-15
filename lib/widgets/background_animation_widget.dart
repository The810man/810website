import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundAnimationWidget extends StatefulWidget {
  const BackgroundAnimationWidget({Key? key}) : super(key: key);

  @override
  State<BackgroundAnimationWidget> createState() =>
      _BackgroundAnimationWidgetState();
}

class _BackgroundAnimationWidgetState extends State<BackgroundAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;
  final List<String> codeSnippets = [
    '810',
    '{',
    '}',
    '<',
    '>',
    '[ ]',
    '( )',
    '...',
    '==',
    '!=',
    '=>',
    'fn',
    'var',
    'if',
    'for',
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60))
          ..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final rand = Random();
    final size = MediaQuery.of(context).size;
    particles = List.generate(30, (_) {
      return Particle(
        x: rand.nextDouble() * size.width,
        y: rand.nextDouble() * size.height,
        vx: (rand.nextDouble() - 0.5) * 0.3,
        vy: (rand.nextDouble() - 0.5) * 0.3,
        text: codeSnippets[rand.nextInt(codeSnippets.length)],
        opacity: rand.nextDouble() * 0.3 + 0.1,
        size: rand.nextDouble() * 10 + 12,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final size = MediaQuery.of(context).size;
        for (final p in particles) {
          p.x += p.vx;
          p.y += p.vy;
          if (p.x < 0 || p.x > size.width) p.vx = -p.vx;
          if (p.y < 0 || p.y > size.height) p.vy = -p.vy;
        }
        return CustomPaint(size: size, painter: ParticlePainter(particles));
      },
    );
  }
}

class Particle {
  double x, y, vx, vy;
  final String text;
  double opacity;
  double size;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.text,
    required this.opacity,
    required this.size,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final paint = Paint()..strokeWidth = 0.5;

    // Draw particles
    for (final particle in particles) {
      final textSpan = TextSpan(
        text: particle.text,
        style: TextStyle(
          color: Colors.white.withOpacity(particle.opacity),
          fontSize: particle.size,
          fontFamily: 'monospace',
        ),
      );
      textPainter.text = textSpan;
      textPainter.layout();
      textPainter.paint(canvas, Offset(particle.x, particle.y));
    }

    // Draw connection lines
    for (var i = 0; i < particles.length; i++) {
      for (var j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];
        final dx = p1.x - p2.x;
        final dy = p1.y - p2.y;
        final dist = sqrt(dx * dx + dy * dy);
        if (dist < 150) {
          final opacity = (1 - dist / 150) * 0.15;
          paint.color = Colors.white.withOpacity(opacity);
          canvas.drawLine(Offset(p1.x, p1.y), Offset(p2.x, p2.y), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
