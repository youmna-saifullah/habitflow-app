import 'package:flutter/widgets.dart';

/// Widget wrappers that keep build methods concise and reusable.
extension WidgetExtensions on Widget {
  /// Wraps widget with symmetric horizontal/vertical padding.
  Widget withSymmetricPadding({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Wraps widget with edge insets.
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  /// Wraps widget with centered alignment.
  Widget centered() {
    return Center(child: this);
  }
}
