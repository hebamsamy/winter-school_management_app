import 'package:flutter/material.dart';
import 'package:school_management_app/Models/student.dart';
import 'package:school_management_app/Network/Api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:school_management_app/Widgets/StudentCard.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Student> Students = [];
  Api api = Api();

  @override
  void initState() {
    GetData();
  }

  GetData() async {
    List<Student> recivedList = await this.api.getAllStudent();
    setState(() {
      this.Students = recivedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("add");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: (this.Students.isEmpty)
          ? SpinKitFadingFour(
              color: Colors.black,
              size: 100,
            )
          : ListView.builder(
              itemCount: this.Students.length,
              itemBuilder: (context, index) => StudentCard(
                    std: this.Students[index],
                  )),
    );
  }
}


// ternary opertor
// (condition)?loader:list
