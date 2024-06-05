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
  });
}
