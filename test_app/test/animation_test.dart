import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/animation.dart';

void main() {
  testWidgets('animation ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AnimationWidget()));
    expect(find.byType(Container), findsOneWidget);
  });
}
