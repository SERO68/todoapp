import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp/landscreen.dart';

import 'package:todoapp/model.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final TextEditingController taskname = TextEditingController();
  final TextEditingController taskdate = TextEditingController();
  final TextEditingController taskdescription = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Task'),
      ),
      body: SafeArea(
        child: Consumer<Model>(
          builder: (context, model, child) {
            return Container(
              padding: const EdgeInsets.all(18),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: taskname,
                        decoration: InputDecoration(
                            labelText: 'Task Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth - 10)),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: taskdate,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                          taskdate.text =
                              "${selectedDate.toLocal()}".split(' ')[0];
                        },
                        decoration: InputDecoration(
                            label: const Text('Select date'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth - 10)),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: taskdescription,
                        decoration: InputDecoration(
                            labelText: 'Task Description',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth - 10)),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Cateagories',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      const Wrap(children: [
                        custombutton('Bussiness'),
                        Padding(padding: EdgeInsets.all(10)),
                        custombutton('Personal'),
                        Padding(padding: EdgeInsets.all(10)),
                        custombutton('Study'),
                        Padding(padding: EdgeInsets.only(top: 55)),
                        custombutton('Language'),
                      ]),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(Size(
                                  constraints.maxWidth - 10,
                                  constraints.maxHeight - 700)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 8, 63, 108))),
                          onPressed: () {
                            model.addtask(taskname);
                            model.updateTaskCounts();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Landscreen()),
                            );
                          },
                          child: const Text('Add Task',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'roboto',
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class custombutton extends StatefulWidget {
  const custombutton(
    this.text, {
    super.key,
  });
  final String text;

  @override
  State<custombutton> createState() => _custombuttonState();
}

class _custombuttonState extends State<custombutton> {
  bool clicked = false;
  Color backcolor = const Color.fromARGB(255, 230, 243, 255);
  Color textcolor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, model, child) {
        bool clicked = model.selectedButton == widget.text;
        return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  clicked ? const Color.fromARGB(255, 8, 63, 108) : backcolor)),
          onPressed: clicked
              ? null
              : () {
                  model.selectButton(widget.text);
                  model.changecatname(widget.text);
                },
          child: Text(
            widget.text,
            style: TextStyle(
                color: clicked ? Colors.white : textcolor, fontSize: 14),
          ),
        );
      },
    );
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
    return Consumer<Model>(builder: (context, model, child) {
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
          });
        },
      );
    });
  }
}
