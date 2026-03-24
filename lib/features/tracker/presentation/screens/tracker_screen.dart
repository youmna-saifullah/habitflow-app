import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

/// Tracker screen that displays static progress insights.
class TrackerScreen extends StatelessWidget {
  /// Creates the tracker screen.
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F5),
      body: SafeArea(
        child: Padding(
          padding: AppConstants.pagePadding,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => context.go(RouteNames.HOME),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Expanded(
                    child: Text(
                      'Tracker',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.headingSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const _TrackerFieldRow(
                hint: 'Select Habit',
                value: 'Shower',
                isAccent: true,
              ),
              const SizedBox(height: 12),
              const _TrackerFieldRow(hint: 'Chart Frequency', value: 'Month'),
              const SizedBox(height: 12),
              const _TrackerFieldRow(hint: 'Show Chart Details', value: 'Off'),
              const SizedBox(height: 14),
              Container(
                height: 168,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.border),
                ),
                child: const _TrackerLineChart(),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.arrow_back,
                    color: Color(0xFFCFD8DC),
                    size: 18,
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'SEPTEMBER',
                    style: AppTextStyle.labelMedium.copyWith(
                      color: const Color(0xFFCFD8DC),
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFFCFD8DC),
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              OutlinedButton.icon(
                onPressed: () => context.go(RouteNames.HOME),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                ),
                icon: const Icon(Icons.pie_chart_outline_rounded, size: 18),
                label: Text(
                  'Success Status',
                  style: AppTextStyle.bodyRegular.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Static row field used to mimic tracker filter controls.
class _TrackerFieldRow extends StatelessWidget {
  /// Creates a tracker field row.
  const _TrackerFieldRow({
    required this.hint,
    required this.value,
    this.isAccent = false,
  });

  /// Left side field hint.
  final String hint;

  /// Right side current value.
  final String value;

  /// Whether value is highlighted using accent color.
  final bool isAccent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              hint,
              style: AppTextStyle.bodyRegular.copyWith(
                color: AppColors.mutedText.withValues(alpha: 0.72),
              ),
            ),
          ),
          Text(
            value,
            style: AppTextStyle.bodyRegular.copyWith(
              color: isAccent ? AppColors.accent : AppColors.lightOnBackground,
            ),
          ),
        ],
      ),
    );
  }
}

/// Lightweight custom-painted line chart for tracker preview.
class _TrackerLineChart extends StatelessWidget {
  /// Creates tracker line chart.
  const _TrackerLineChart();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrackerLinePainter(),
      child: const SizedBox.expand(),
    );
  }
}

/// Painter that draws a smooth cyan trend line similar to the reference design.
class _TrackerLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = AppColors.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final Path path = Path()
      ..moveTo(0, size.height * 0.58)
      ..cubicTo(
        size.width * 0.10,
        size.height * 0.90,
        size.width * 0.18,
        size.height * 0.12,
        size.width * 0.34,
        size.height * 0.44,
      )
      ..cubicTo(
        size.width * 0.42,
        size.height * 0.66,
        size.width * 0.52,
        size.height * 0.22,
        size.width * 0.62,
        size.height * 0.50,
      )
      ..cubicTo(
        size.width * 0.74,
        size.height * 0.84,
        size.width * 0.86,
        size.height * 0.18,
        size.width,
        size.height * 0.02,
      );

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
