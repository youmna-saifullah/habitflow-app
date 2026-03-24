import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../theme/app_colors.dart';

// Reusable brand logo widget implemented with native Flutter painting.
///
/// Flutter does not support SVG rendering without an external package,
/// so this widget draws an equivalent logo style while still keeping a
/// semantic link to the asset constant.
class AppBrandLogo extends StatelessWidget {
  /// Creates a brand logo widget.
  const AppBrandLogo({super.key, this.size = 96});

  /// Square logo size.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Habit Tracker logo from ${AppAssets.appLogo}',
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size * 0.26),
          gradient: const LinearGradient(
            colors: <Color>[AppColors.primary, AppColors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x226C5CE7),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: size * 0.36,
              height: size * 0.36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Positioned.fill(child: CustomPaint(painter: _SmilePainter())),
          ],
        ),
      ),
    );
  }
}

/// Painter for the lower curved stroke in the app logo mark.
class _SmilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06
      ..strokeCap = StrokeCap.round;

    final Path path = Path()
      ..moveTo(size.width * 0.30, size.height * 0.60)
      ..quadraticBezierTo(
        size.width * 0.50,
        size.height * 0.84,
        size.width * 0.70,
        size.height * 0.60,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
