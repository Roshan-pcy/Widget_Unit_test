import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/NewHome.dart';

void main() {
  testWidgets('Showing list of user data...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: NewHome(),
    ));

    expect(find.byType(CircularProgressIndicator), findsOne);
  });
}
