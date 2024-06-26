import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/user.dart';

class Userrepo {
  Future<List<User>> fetchUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      return jsonList.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('failed to fecth');
    }
  }
}
