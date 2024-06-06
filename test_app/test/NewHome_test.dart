import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/NewHome.dart';
import 'package:test_app/user.dart';

void main() {
  testWidgets('Showing list of user data...', (tester) async {
    final users = [
      User(name: 'my name', email: 'myname@gmail.com', id: 10),
      User(name: 'my name', email: 'myname@gmail.com', id: 10)
    ];
    Future<List<User>> usersList() async {
      return await Future.delayed(const Duration(seconds: 1), () => users);
    }

    await tester.pumpWidget(MaterialApp(home: NewHome(user: usersList())));

    expect(find.byType(CircularProgressIndicator), findsOne);
    await tester.pumpAndSettle();
    expect(
        find.byType(
          ListView,
        ),
        findsOne);
    expect(
        find.byType(
          ListTile,
        ),
        findsNWidgets(users.length));
    for (var user in users) {
      expect(find.text(user.name), findsOne);
      expect(find.text(user.email), findsOne);
    }
  });
}
