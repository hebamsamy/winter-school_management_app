import 'package:flutter/material.dart';
import 'package:school_management_app/Models/student.dart';
import 'package:school_management_app/Network/Api.dart';

class StudentCard extends StatelessWidget {
  Student std;
  Api api = Api();
  StudentCard({required this.std});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          leading: Text(this.std.ID.toString()),
          title: Text(this.std.Name),
          subtitle: Text(this.std.Email),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            color: Colors.amber,
          ),
          IconButton(
            onPressed: () async {
              bool isdone = await api.DeleteStudent(this.std.ID);
              if (isdone == true) {
                Navigator.of(context).pushReplacementNamed("/");
              } else {
                print("Failed");
              }
            },
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
        ]),
      ],
    ));
  }
}
