import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model.dart';

class Addtask extends StatefulWidget {
  Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final TextEditingController taskname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: Consumer<Model>(builder: (context, model, child) {
          return Container(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: taskname,
                    decoration: InputDecoration(
                        labelText: 'Task Title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        constraints: const BoxConstraints(
                            maxHeight: 60,
                            minHeight: 30,
                            maxWidth: 200,
                            minWidth: 180)),
                  ),
                  const SizedBox(height: 10),
                  MyDropdown(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 8, 63, 108))),
                    onPressed: () {
                    
                      model.addtask(taskname);
                    },
                    child: const Text('Add Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'roboto',
                            fontSize: 20)),
                  ),
                ],
              ),
            ),
          );
        })));
  }
}

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? dropdownValue = 'Bussiness';

  @override
  Widget build(BuildContext context) {
    return  Consumer<Model>(builder: (context, model, child){
    return DropdownButton<String>(
      value: dropdownValue,
      hint: const Text('Select Category'),
      items: <String>['Bussiness', 'Personal', 'Study', 'Language']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue;
         model.changecatname(dropdownValue);
        });
      },
    );
  });
}
}