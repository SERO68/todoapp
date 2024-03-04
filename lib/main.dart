import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/register.dart';
import 'model.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => 
      ChangeNotifierProvider(
        create: (context) => Model(),
        child: const MyApp(),
      ),
     ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       locale: DevicePreview.locale(context),
       builder: DevicePreview.appBuilder,
      title: 'Register',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 31, 26, 162)),
        useMaterial3: true,
      ),
      home:  Register(),
    );
  }
}
