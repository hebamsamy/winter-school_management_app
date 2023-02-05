import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:school_management_app/Models/student.dart';
import 'package:school_management_app/Network/Api.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  AddStudent std = AddStudent(
      FirstName: "",
      LastName: "",
      NationalID: "",
      Email: "",
      Age: 0,
      Mobile: "");
  Api api = Api();
  var formKey = GlobalKey<FormState>();
  void SaveForm() async {
    print("SUBMITED");
    if (formKey.currentState!.validate()) {
      //no error send to api
      formKey.currentState?.save();
      bool isdone = await api.AddNewStudent(this.std);
      if (isdone == true) {
        Navigator.of(context).pushNamedAndRemoveUntil("/", (data) => false);
      } else {
        this.formKey.currentState?.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Student"),
        actions: [
          IconButton(
              onPressed: () {
                this.formKey.currentState?.reset();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (newValue) {
                    this.std.FirstName = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Student frist name is required";
                    } else if (value.length < 3) {
                      return "number of character must be atleast 3";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("Frist Name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (newValue) {
                    this.std.LastName = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Student last name is required";
                    } else if (value.length < 3) {
                      return "number of character must be atleast 3";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("Last Name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  onSaved: (newValue) {
                    this.std.Email = newValue!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Student Email is required";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("Email")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  onSaved: (newValue) {
                    this.std.Mobile = newValue!;
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Student Mobile is required";
                    } else if (value.length < 11) {
                      return "mobile number must be atleast 11";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("Mobile Number")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  onSaved: (newValue) {
                    this.std.NationalID = newValue!;
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Student National is required";
                    } else if (value.length < 14) {
                      return "national id number must be atleast 14";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("National ID")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextFormField(
                  onSaved: (newValue) {
                    this.std.Age = int.parse(newValue!);
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Student age is required";
                    } else if (int.parse(value) > 18) {
                      return "age less than 18";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("Age")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: OutlinedButton.icon(
                    onPressed: SaveForm,
                    icon: Icon(Icons.add),
                    label: Text("Add Student")),
              )
            ],
          )),
    );
  }
}
