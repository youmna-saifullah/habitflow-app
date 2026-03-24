import 'package:flutter/material.dart';

import '../config/responsive_config.dart';

/// Responsive helpers based on shared breakpoint configuration.
extension ResponsiveExtension on BuildContext {
  /// Indicates whether current layout should be considered mobile.
  bool get isMobile =>
      MediaQuery.of(this).size.width <= ResponsiveConfig.mobileMaxWidth;

  /// Indicates whether current layout should be considered tablet.
  bool get isTablet {
    final double width = MediaQuery.of(this).size.width;
    return width > ResponsiveConfig.mobileMaxWidth &&
        width <= ResponsiveConfig.tabletMaxWidth;
  }

  /// Indicates whether current layout should be considered desktop.
  bool get isDesktop =>
      MediaQuery.of(this).size.width > ResponsiveConfig.tabletMaxWidth;
}
