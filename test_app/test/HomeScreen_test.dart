import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/HomeScreen.dart';

void main() {
  testWidgets('given counter is zero  when increament  is clicked should be 1',
      (tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: MyHomePage(title: 'title')));
    final ctr = find.text('0');
    expect(ctr, findsOne);
    final ctr2 = find.text('1');
    expect(ctr2, findsNothing);

    final increment = find.byKey(const Key('increament'));
    await tester.tap(increment);
    await tester.pump();
    final ctr3 = find.text('1');
    expect(ctr3, findsOne);
    final ctr4 = find.text('0');
    expect(ctr4, findsNothing);
    expect(
        find.byType(
          AppBar,
        ),
        findsOne);
  });
}
