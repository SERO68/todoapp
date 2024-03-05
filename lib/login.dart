
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'landscreen.dart';
import 'model.dart';
import 'package:provider/provider.dart';

import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final GlobalKey<FormState> name = GlobalKey();

  final email = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
              Color.fromRGBO(43, 11, 171, 1),
              Color.fromRGBO(92, 81, 193, 1)
            ])),
        child: SafeArea(
          child: Consumer<Model>(builder: (context, model, child) {
            return Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: Color.fromARGB(255, 223, 223, 223),
                                  ),
                                  Text(
                                    'Do not have an account ? ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 223, 223, 223)),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'SeroDo',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontFamily: 'logo',
                                fontSize: 50),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ])),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            const Column(
                            children: [
                              Text(
                                'Welecom Back.',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    fontFamily: 'fonthead2',
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Enter your details Below.',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    fontFamily: 'fonthead4',
                                    color: Color.fromARGB(255, 162, 161, 161)),
                                textAlign: TextAlign.center,
                              ),
                             
                            
                            ],
                          ),
                          Form(
                              key: name,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [ model.errortext,
                                    const SizedBox(height: 8,),
                                      TextFormField(
                                        controller: email,
                                        decoration: InputDecoration(
                                            constraints: BoxConstraints(
                                                maxWidth:
                                                    constraints.maxWidth - 40),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            labelText: 'Email Address'),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email address';
                                          }

                                          if (value.length < 8 ||
                                              !value.contains('@')) {
                                            return 'Please enter a correct email address';
                                          }

                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: password,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            constraints: BoxConstraints(
                                                maxHeight:
                                                    constraints.maxHeight,
                                                maxWidth:
                                                    constraints.maxWidth - 40),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            labelText: 'Password'),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Password';
                                          }

                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      56, 60, 217, 1),
                                                  Color.fromRGBO(
                                                      238, 163, 254, 1)
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      Size(
                                                          constraints.maxWidth -
                                                              40,
                                                          40)),
                                              maximumSize:
                                                  MaterialStateProperty.all(
                                                      Size(constraints.maxWidth,
                                                          40)),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                          onPressed: () {
                                            if (name.currentState!.validate()) {
                                              model.emaillogin = email;
                                              model.passwordlogin = password;
                                              if (model.checkUserExists()) {
                                              
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                           Landscreen()),
                                                );
                                              }
                                            } else {}
                                          },
                                          child: const Text(
                                            'Sign in',
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(
                                          style: ButtonStyle(
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      Colors.transparent)),
                                          onPressed: () {},
                                          child: const Text(
                                              'Forget your Password?')),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              indent: 20,
                                              endIndent: 10,
                                              color: Color.fromARGB(
                                                  255, 162, 161, 161),
                                              thickness: 1,
                                            ),
                                          ),
                                          Text(
                                            "Or sign in with",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 162, 161, 161)),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              endIndent: 20,
                                              indent: 10,
                                              color: Color.fromARGB(
                                                  255, 162, 161, 161),
                                              thickness: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: const FaIcon(
                                                FontAwesomeIcons.google),
                                            label: const Text('Google'),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color.fromARGB(
                                                          187, 229, 236, 239)),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0), // Adjust the radius here
                                                ),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color.fromARGB(
                                                            187,
                                                            229,
                                                            236,
                                                            239)),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0), // Adjust the radius here
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.microsoft),
                                              label: const Text('Outlook')),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
