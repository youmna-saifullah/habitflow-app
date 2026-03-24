import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

/// Splash entry screen that forwards to home after a short delay.
class SplashScreen extends StatelessWidget {
  /// Creates the splash screen.
  const SplashScreen({super.key});

  /// Splash delay before automatic navigation.
  static const Duration _navigationDelay = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: _navigationDelay,
      onEnd: () {
        // Splash forwards into the primary home flow after initial branding.
        context.go(RouteNames.HOME);
      },
      builder: (BuildContext context, double value, Widget? child) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: Padding(
            padding: AppConstants.pagePadding,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Habit',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headingLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Tracker',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headingSmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.72),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Live the way your desire!',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.labelMedium.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
