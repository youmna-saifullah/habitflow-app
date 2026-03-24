import 'package:flutter/widgets.dart';

/// Numeric helper extensions for spacing widgets.
extension NumSpacingExtension on num {
  /// Vertical spacing using current numeric value.
  SizedBox get hSpace => SizedBox(height: toDouble());

  /// Horizontal spacing using current numeric value.
  SizedBox get wSpace => SizedBox(width: toDouble());
}
