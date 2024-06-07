import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/animation.dart';

void main() {
  testWidgets('animation ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AnimationWidget()));
    var typecontainer = find.byType(Container);
    expect(typecontainer, findsOneWidget);
    var container = tester.widget<Container>(typecontainer);
    expect(container.constraints!.minWidth, 10);
    expect(container.constraints!.minHeight, 10);
    expect((container.decoration as BoxDecoration).color, Colors.pink);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(0));
    //pumpsettel used for re build and it will come final state
    await tester.pumpAndSettle();
    typecontainer = find.byType(Container);
    container = tester.widget<Container>(typecontainer);
    expect(container.constraints!.minWidth, 190);
    expect(container.constraints!.minHeight, 190);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(30));
  });
}
