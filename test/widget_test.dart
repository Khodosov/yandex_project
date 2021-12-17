import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yandex_project/presentation/widgets/keyboard_area_widget.dart';

void main() {
  testWidgets(
    'Looking for padding on KeyboardArea',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: KeyboardArea(
            child: Placeholder(),
          ),
        ),
      );
      expect(find.byType(Padding), findsOneWidget);
    },
  );
  test(
    'test initial value',
    () {

    },
  );
}
