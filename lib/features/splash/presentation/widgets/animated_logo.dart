import 'package:flutter/material.dart';

import '../../../../core/widgets/more/app_brand_logo.dart';

/// Reusable animated logo for splash and future onboarding screens.
class AnimatedLogo extends StatelessWidget {
  /// Creates an animated logo widget.
  const AnimatedLogo({super.key, this.size = 120});

  /// Visual size of the square logo area.
  final double size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.88, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutBack,
      builder: (BuildContext context, double scale, Widget? child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: AppBrandLogo(size: size),
    );
  }
}
