import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'addtask.dart';
import 'model.dart';

class Landscreen extends StatefulWidget {
  Landscreen({super.key});

  @override
  State<Landscreen> createState() => _LandscreenState();
}

class _LandscreenState extends State<Landscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 8, 63, 108),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addtask()),
            );
          },
          child: const FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 8, 63, 108),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const ListTile(
                  title: Text(
                    'name',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  subtitle: Text(
                    'email',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Templates',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.category,
                          color: Colors.white,
                        ),
                        title: const Text('Categories',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.analytics,
                          color: Colors.white,
                        ),
                        title: const Text('Analytics',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: const Text('Settings',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                    ]),
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  'Thank you \nSero Studio',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'roboto'),
                )
              ],
            ),
          ),
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFFF8FAFF)),
          child: SafeArea(
                           child:  Consumer<Model>(builder: (context, model, child) {

            return Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text('What is up, name!'),
                  const Text('catagories'),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.catagoriecardlist.length,
                        itemBuilder: (context, i) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                  color: model.catagoriecardlist[i]['color']),
                            ),
                            color: Colors.white,
                            elevation: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 80),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${model.catagoriecardlist[i]['numtasks']} tasks',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 62, 62, 62),
                                        fontSize: 12,
                                        fontFamily: 'roboto'),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '${model.catagoriecardlist[i]['catname']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'roboto'),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const Text('Tasks of Today'),
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                      itemCount: model.todaytaskslist.length,
                      itemBuilder: (context, i) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: model.todaytaskslist[i]['color']),
                          ),
                          color: Colors.white,
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Checkboxcustom(model.todaytaskslist[i]['taskstate']),
                                Expanded(
                                  child: Text(
                                    '${model.todaytaskslist[i]['taskname']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'roboto'),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        model.todaytaskslist.removeAt(i);
                                      });
                                    })
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
  }),
        )));
  }
}

class Catagoriecard {
  int numtasks;
  String catname;
  Catagoriecard({
    required this.catname,
    required this.numtasks,
  });
}

// ignore: must_be_immutable
class Checkboxcustom extends StatefulWidget {
  Checkboxcustom(this.taskstate, {super.key});
  bool taskstate;

  @override
  State<Checkboxcustom> createState() => _CheckboxcustomState();
}

class _CheckboxcustomState extends State<Checkboxcustom> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: widget.taskstate,
        onChanged: (val) {
          setState(() {
            widget.taskstate = val!;
          });
        });
  }
}
