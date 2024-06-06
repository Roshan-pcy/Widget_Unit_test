import 'package:flutter/material.dart';
import 'package:test_app/user.dart';
import 'package:test_app/userrepo.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  Userrepo userrepo = Userrepo();
  late Future<List<User>> user;

  @override
  void initState() {
    super.initState();
    user = userrepo.fetchUser();
    print("list of user ${user}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('error'));
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!;

                return ListTile(
                  title: Text(data[index].name),
                  subtitle: Text(data[index].email),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
