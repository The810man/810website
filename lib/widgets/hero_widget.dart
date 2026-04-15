import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/button.dart';
import 'dart:async';

final heroTypingProvider =
    StateNotifierProvider<HeroTypingNotifier, String>((ref) {
  return HeroTypingNotifier();
});

class HeroTypingNotifier extends StateNotifier<String> {
  HeroTypingNotifier() : super('') {
    _startTyping();
  }

  final String fullText = r'$ sudo initialize 810_studios.sh';
  Timer? _timer;
  int _index = 0;

  void _startTyping() {
    _timer = Timer.periodic(Duration(milliseconds: 80), (timer) {
      if (_index <= fullText.length) {
        state = fullText.substring(0, _index);
        _index++;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class HeroWidget extends ConsumerWidget {
  const HeroWidget({Key? key}) : super(key: key);

  static const String fullText = r'$ sudo initialize 810_studios.sh';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedText = ref.watch(heroTypingProvider);

    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.25,
            child: AnimatedContainer(
              duration: Duration(seconds: 8),
              curve: Curves.easeInOut,
              width: 384,
              height: 384,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(192),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 48,
                    spreadRadius: 0,
                  ),
                ],
              ),
              // For animation curve and opacity transitions, further work needed
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: AnimatedContainer(
              duration: Duration(seconds: 8),
              curve: Curves.easeInOut,
              width: 384,
              height: 384,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(192),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 48,
                    spreadRadius: 0,
                  ),
                ],
              ),
              // For animation curve and opacity transitions, further work needed
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      '$displayedText\n_',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  AnimatedOpacity(
                    opacity: displayedText.length >= fullText.length ? 1 : 0,
                    duration: Duration(seconds: 1),
                    child: Text(
                      '810 Studios',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  AnimatedOpacity(
                    opacity: displayedText.length >= fullText.length ? 1 : 0,
                    duration: Duration(seconds: 1),
                    child: Text(
                      'Creating experiences that matter',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Wrap(
                    spacing: 16,
                    children: [
                      HoverableButton(
                        onPressed: () {},
                        child: _buildTag('Games'),
                      ),
                      HoverableButton(
                        onPressed: () {},
                        child: _buildTag('VR'),
                      ),
                      HoverableButton(
                        onPressed: () {},
                        child: _buildTag('Hardware'),
                      ),
                      HoverableButton(
                        onPressed: () {},
                        child: _buildTag('Open Source'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width / 2 - 16,
            child: _ChevronDownAnimation(),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.05),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
      ),
    );
  }
}

class _ChevronDownAnimation extends StatefulWidget {
  const _ChevronDownAnimation({Key? key}) : super(key: key);

  @override
  State<_ChevronDownAnimation> createState() => _ChevronDownAnimationState();
}

class _ChevronDownAnimationState extends State<_ChevronDownAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child:
              Icon(Icons.keyboard_arrow_down, size: 32, color: Colors.white70),
        );
      },
    );
  }
}

// Removed duplicated _buildTag and _ChevronDownAnimation classes
