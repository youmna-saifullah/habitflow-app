import 'package:flutter/material.dart';

import '../../../../core/widgets/cards/app_tracker_card.dart';

/// Reusable chart-like widget visualizing completion percentage.
class TrackerChart extends StatelessWidget {
  /// Creates a tracker chart widget.
  const TrackerChart({required this.percentage, super.key});

  /// Completion percentage in the range 0.0 to 1.0.
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return AppTrackerCard(percentage: percentage);
  }
}
