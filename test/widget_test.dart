import 'package:flutter_test/flutter_test.dart';

import 'package:habit_tracker_app/app/app_name.dart';

void main() {
  testWidgets('App bootstraps with splash branding', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HabitTrackerApp());

    expect(find.text('Habit'), findsOneWidget);
    expect(find.text('Tracker'), findsOneWidget);
  });
}
