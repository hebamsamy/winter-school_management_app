class Student {
  int ID;
  String Name;
  String Mobile;
  String Email;
  String NationalID;
  int Age;

  Student({
    required this.Name,
    required this.ID,
    required this.NationalID,
    required this.Email,
    required this.Age,
    required this.Mobile,
  });
}

class AddStudent {
  String LastName;
  String FirstName;
  String Mobile;
  String Email;
  String NationalID;
  int Age;

  AddStudent({
    required this.FirstName,
    required this.LastName,
    required this.NationalID,
    required this.Email,
    required this.Age,
    required this.Mobile,
  });
}

class UpdateStudent {
  String NameEnglish;
  String NameArabic;
  String LastName;
  String FirstName;
  String Mobile;
  String Email;
  String NationalID;
  int Age;
  int ID;

  UpdateStudent({
    required this.FirstName,
    required this.LastName,
    required this.NationalID,
    required this.Email,
    required this.Age,
    required this.Mobile,
    required this.ID,
    required this.NameArabic,
    required this.NameEnglish,
  });
}
