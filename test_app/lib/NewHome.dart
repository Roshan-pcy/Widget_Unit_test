import 'package:flutter/material.dart';
import 'package:test_app/user.dart';
import 'package:test_app/userrepo.dart';

class NewHome extends StatefulWidget {
  late Future<List<User>> user;

  NewHome({super.key, required this.user});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  Userrepo userrepo = Userrepo();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: widget.user,
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
