
import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  List catagoriecardlist = [
    {
      'numtasks': '10',
      'catname': 'Bussiness',
      'numcat': 1,
      'color': Colors.amber
    },
    {
      'numtasks': '12',
      'catname': 'Personal',
      'numcat': 2,
      'color': Colors.blue
    },
    {
      'numtasks': '30',
      'catname': 'Study',
      'numcat': 3,
      'color': Colors.cyanAccent
    },
    {
      'numtasks': '5',
      'catname': 'Language',
      'numcat': 4,
      'color': Colors.orange
    },
    {'numtasks': '5', 'catname': 'Language', 'numcat': 5, 'color': Colors.red},
    {
      'numtasks': '5',
      'catname': 'Language',
      'numcat': 6,
      'color': Colors.green
    },
    {'numtasks': '5', 'catname': 'Language', 'numcat': 7, 'color': Colors.teal},
    {
      'numtasks': '5',
      'catname': 'Language',
      'numcat': 8,
      'color': Colors.deepPurple
    },
    {
      'numtasks': '5',
      'catname': 'Language',
      'numcat': 9,
      'color': Colors.deepPurpleAccent
    },
    {
      'numtasks': '5',
      'catname': 'Language',
      'numcat': 10,
      'color': Colors.blueGrey
    },
  ];

  List todaytaskslist = [
    {
      'taskstate': false,
      'taskname': 'Pay for rent',
      'taskcat': 2,
      'color': Colors.blue
    },
    {
      'taskstate': true,
      'taskname': 'check emails',
      'taskcat': 1,
      'color': Colors.amber
    },
    {
      'taskstate': false,
      'taskname': 'meeting',
      'taskcat': 1,
      'color': Colors.amber
    },
    {
      'taskstate': false,
      'taskname': 'lunch with cat',
      'taskcat': 2,
      'color': Colors.blue
    },
    {
      'taskstate': true,
      'taskname': 'study flutter',
      'taskcat': 3,
      'color': Colors.cyanAccent
    },
    {
      'taskstate': false,
      'taskname': 'spanish class',
      'taskcat': 4,
      'color': Colors.orange
    },
    {
      'taskstate': true,
      'taskname': 'voulnteering',
      'taskcat': 2,
      'color': Colors.blue
    },
    {
      'taskstate': false,
      'taskname': 'kill someone',
      'taskcat': 2,
      'color': Colors.blue
    },
  ];
  String? catname = '';
  int catnum = 0;
    Color color1=Colors.black;
  void changecatname(String? catname2) {
    catname = catname2;
    print(catname);
    if (catname == 'Bussiness') {
      catnum = 1;
      color1 = Colors.amber;
    } else if (catname == 'Personal') {
      catnum = 2;
       color1 = Colors.blue;
    } else if (catname == 'Study') {
      catnum = 3;
       color1 = Colors.cyanAccent;
    } else if (catname == 'Language') {
      catnum = 4;
       color1 = Colors.orange;
    }
    notifyListeners();
  }

  void addtask(TextEditingController namec) {
    String name = namec.text;
    Map Task = 
      {'taskstate': false, 'taskname': name, 'taskcat': catnum, 'color': color1};
print(Task);    todaytaskslist.insert(0, Task);
    notifyListeners();
  }
  /////////////////////////

  String lastname = '';
  String lastemail = '';

  TextEditingController emaillogin = TextEditingController();
  TextEditingController passwordlogin = TextEditingController();

  Text error2 = const Text(
    'We didnt find any user',
    style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'roboto'),
    textAlign: TextAlign.center,
  );
  Text error1 = const Text(
    '',
  );

  Text _errotext1 = const Text(
    '',
    style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'roboto'),
    textAlign: TextAlign.center,
  );
  Text get errortext => _errotext1;

  List<Map<String, String>> users = [
    {'email': 'ahmed@gmail.com', 'password': 'Pass@123', 'name': 'Ahmed'},
    {'email': 'mostafa@yahoo.com', 'password': 'Pass@123', 'name': 'mostafa'},
  ];
  var count = 0;

  void adduser(TextEditingController addemail, TextEditingController addpass,
      TextEditingController addname) {
    String email = addemail.text;
    String pass = addpass.text;
    String name = addpass.text;
    Map<String, String> mapadd = {
      'email': email,
      'password': pass,
      'name': name
    };
    users.add(mapadd);
  }

  bool checkUserExists() {
    String emailInput = emaillogin.text;
    String passwordInput = passwordlogin.text;

    bool userExists = users.any((user) {
      return user['email'] == emailInput && user['password'] == passwordInput;
    });

    if (!userExists) {
      _errotext1 = error2;
      notifyListeners();
    } else {
      lastemail = emailInput;

      _errotext1 = error1;
      notifyListeners();
    }

    return userExists;
  }
}
