import 'dart:math';

import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Full-bleed canvas of drifting code glyphs connected by faint lines when
/// close together — a straight port of the original site's canvas-based
/// BackgroundAnimation, redrawn every tick with a [CustomPainter].
class BackgroundAnimationWidget extends StatefulWidget {
  const BackgroundAnimationWidget({super.key});

  @override
  State<BackgroundAnimationWidget> createState() =>
      _BackgroundAnimationWidgetState();
}

class _BackgroundAnimationWidgetState extends State<BackgroundAnimationWidget>
    with SingleTickerProviderStateMixin {
  static const _codeSnippets = [
    '810', '{', '}', '<', '>', '[ ]', '( )', '...',
    '==', '!=', '=>', 'fn', 'var', 'if', 'for', //
  ];
  static const _particleCount = 30;
  static const _linkDistance = 150.0;

  late final AnimationController _controller;
  List<_Particle>? _particles;

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
    _particles ??= _seedParticles(MediaQuery.sizeOf(context));
  }

  List<_Particle> _seedParticles(Size size) {
    final rand = Random();
    return List.generate(_particleCount, (_) {
      return _Particle(
        position: Offset(rand.nextDouble() * size.width, rand.nextDouble() * size.height),
        velocity: Offset((rand.nextDouble() - 0.5) * 0.3, (rand.nextDouble() - 0.5) * 0.3),
        text: _codeSnippets[rand.nextInt(_codeSnippets.length)],
        opacity: rand.nextDouble() * 0.3 + 0.1,
        fontSize: rand.nextDouble() * 10 + 12,
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
    return IgnorePointer(
      child: Opacity(
        opacity: 0.2,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final size = MediaQuery.sizeOf(context);
            for (final p in _particles!) {
              p.step(size);
            }
            return CustomPaint(
              size: size,
              painter: _ParticlePainter(_particles!, _linkDistance),
            );
          },
        ),
      ),
    );
  }
}

class _Particle {
  _Particle({
    required this.position,
    required this.velocity,
    required this.text,
    required this.opacity,
    required this.fontSize,
  });

  Offset position;
  Offset velocity;
  final String text;
  final double opacity;
  final double fontSize;

  void step(Size bounds) {
    position += velocity;
    var vx = velocity.dx;
    var vy = velocity.dy;
    if (position.dx < 0 || position.dx > bounds.width) vx = -vx;
    if (position.dy < 0 || position.dy > bounds.height) vy = -vy;
    velocity = Offset(vx, vy);
  }
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter(this.particles, this.linkDistance);

  final List<_Particle> particles;
  final double linkDistance;

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final linePaint = Paint()..strokeWidth = 0.5;

    for (final particle in particles) {
      textPainter.text = TextSpan(
        text: particle.text,
        style: TextStyle(
          color: AppColors.foreground.withValues(alpha: particle.opacity),
          fontSize: particle.fontSize,
          fontFamily: AppFonts.mono,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, particle.position);
    }

    for (var i = 0; i < particles.length; i++) {
      for (var j = i + 1; j < particles.length; j++) {
        final delta = particles[i].position - particles[j].position;
        final distance = delta.distance;
        if (distance < linkDistance) {
          final opacity = (1 - distance / linkDistance) * 0.15;
          linePaint.color = AppColors.foreground.withValues(alpha: opacity);
          canvas.drawLine(particles[i].position, particles[j].position, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
