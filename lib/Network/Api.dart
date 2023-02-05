import 'dart:convert';
import 'package:http/http.dart';
import 'package:school_management_app/Models/student.dart';

class Api {
  Future<bool> DeleteStudent(int id) async {
    //https://api.mohamed-sadek.com/Student/Delete?id=836
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/Delete/id=$id");
    Response response = await delete(
      path,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(id);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> AddNewStudent(AddStudent newStd) async {
    //https://api.mohamed-sadek.com/Student/post
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/POST");
    Response response = await post(path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          "FirstName": newStd.FirstName,
          "LastName": newStd.LastName,
          "Mobile": newStd.Mobile,
          "Email": newStd.Email,
          "NationalID": newStd.NationalID,
          "Age": newStd.Age
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Student>> getAllStudent() async {
    List<Student> list = [];
    //https://api.mohamed-sadek.com/Student/Get
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/Get");
    Response response = await get(path);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List stds = data["Data"] as List;
      list = stds
          .map((std) => Student(
              Name: std["Name"],
              ID: std["ID"],
              NationalID: std["NationalID"],
              Email: std["Email"],
              Age: std["Age"],
              Mobile: std["Mobile"]))
          .toList();
      return list;
    } else {
      print("something wrong happend");
      return list;
    }
  }

  Future<Student> GetOneStudent(int id) async {
    Student student;
    Uri path =
        Uri.https("api.mohamed-sadek.com", "/Student//Student/GetByID/id=$id");
    Response response = await get(
      path,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      student = Student(
          Name: data["Data"]["Name"],
          ID: data["Data"]["ID"],
          NationalID: data["Data"]["NationalID"],
          Email: data["Data"]["Email"],
          Age: data["Data"]["Age"],
          Mobile: data["Data"]["Mobile"]);

      return student;
    } else {
      print("something wrong happend");
      return Student(
          Name: "Name",
          ID: 0,
          NationalID: "NationalID",
          Email: "Email",
          Age: 0,
          Mobile: "Mobile");
    }
  }

  Future<bool> UpdateExietsStudent(UpdateStudent newStd) async {
    //https://api.mohamed-sadek.com/Student/post
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/PUT");
    Response response = await put(path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          "ID": newStd.ID,
          "NameArabic": newStd.NameArabic,
          "NameEnglish": newStd.NameEnglish,
          "FirstName": newStd.FirstName,
          "LastName": newStd.LastName,
          "Mobile": newStd.Mobile,
          "Email": newStd.Email,
          "NationalID": newStd.NationalID,
          "Age": newStd.Age
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
