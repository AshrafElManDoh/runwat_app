import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimationLine extends StatefulWidget {
  const AnimationLine({super.key});

  @override
  State<AnimationLine> createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
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
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [_controller.value, 0.0, 1.0],
              colors: [Colors.transparent, Colors.black, Colors.black],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: SvgPicture.asset('assets/logo/line.svg'),
        );
      },
    );
  }
}
