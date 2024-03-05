import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  List catagoriecardlist = [
    {
      'numtasks': '2',
      'catname': 'Bussiness',
      'numcat': 1,
      'color': Colors.amber
    },
    {'numtasks': '4', 'catname': 'Personal', 'numcat': 2, 'color': Colors.blue},
    {
      'numtasks': '1',
      'catname': 'Study',
      'numcat': 3,
      'color': Colors.cyanAccent
    },
    {
      'numtasks': '1',
      'catname': 'Language',
      'numcat': 4,
      'color': Colors.orange
    },
  ];

  List todaytaskslist = [
    {
      'taskstate': false,
      'taskname': 'Pay for rent',
      'taskcat': 2,
      'color': Colors.blue,
      'date': '2024-03-05',
      'description': 'some description here'
    },
    {
      'taskstate': true,
      'taskname': 'check emails',
      'taskcat': 1,
      'color': Colors.amber,
      'date': '2024-03-05',
      'description': 'some description here'
    },
    {
      'taskstate': false,
      'taskname': 'meeting',
      'taskcat': 1,
      'color': Colors.amber,
      'date': '2024-03-05',
      'description': 'some description here'
    },
    {
      'taskstate': false,
      'taskname': 'lunch with cat',
      'taskcat': 2,
      'color': Colors.blue,
      'date': '2024-03-07',
      'description': 'some description here'
    },
    {
      'taskstate': true,
      'taskname': 'study flutter',
      'taskcat': 3,
      'color': Colors.cyanAccent,
      'date': '2024-03-05',
      'description': 'some description here'
    },
    {
      'taskstate': false,
      'taskname': 'spanish class',
      'taskcat': 4,
      'color': Colors.orange,
      'date': '2024-03-06',
      'description': 'some description here'
    },
    {
      'taskstate': true,
      'taskname': 'voulnteering',
      'taskcat': 2,
      'color': Colors.blue,
      'date': '2024-03-05',
      'description': 'some description here'
    },
    {
      'taskstate': false,
      'taskname': 'kill someone',
      'taskcat': 2,
      'color': Colors.blue,
      'date': '2024-03-05',
      'description': 'some description here'
    },
  ];
  String? catname = '';
  int catnum = 0;
  Color color1 = Colors.black;
  void changecatname(String? catname2) {
    catname = catname2;

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
    Map task = {
      'taskstate': false,
      'taskname': name,
      'taskcat': catnum,
      'color': color1
    };

    todaytaskslist.insert(0, task);
    notifyListeners();
  }

  void updateTaskCounts() {
    Map<int, int> taskCounts = {};

    for (var task in todaytaskslist) {
      int taskCat = task['taskcat'];
      if (!taskCounts.containsKey(taskCat)) {
        taskCounts[taskCat] = 0;
      }
      taskCounts[taskCat] = (taskCounts[taskCat] ?? 0) + 1;
    }

    for (var category in catagoriecardlist) {
      int numCat = category['numcat'];
      if (taskCounts.containsKey(numCat)) {
        category['numtasks'] = taskCounts[numCat].toString();
      } else {
        category['numtasks'] = '0';
      }
    }
  }
  /////////////////////////

  String _selectedButton = '';

  String get selectedButton => _selectedButton;

  void selectButton(String button) {
    _selectedButton = button;
    notifyListeners();
  }

  ////////////

  String lastname = 'Mohamed';
  String lastemail = 'gg@gmail.com';

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
    {'email': 'mostafa@yahoo.com', 'password': 'Pass@123', 'name': 'Mostafa'},
  ];
  var count = 0;

  void adduser(TextEditingController addemail, TextEditingController addpass,
      TextEditingController addname) {
    String email = addemail.text;
    String pass = addpass.text;
    String name = addname.text;
    Map<String, String> mapadd = {
      'email': email,
      'password': pass,
      'name': name
    };
    users.add(mapadd);
      lastname = name;
       lastemail = email;
       notifyListeners();
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
      _errotext1 = error1;
      lastemail = emailInput;

      for (var e in users) {
        if (lastemail == e['email']) {
          lastname = e['name']!;
        }
      }
      notifyListeners();
    }

    return userExists;
  }
}
