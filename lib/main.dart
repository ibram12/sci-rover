import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pdf_reader_app/jus/taha.dart';
import 'package:pdf_reader_app/screen/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/Sign/Sign_In.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Future<bool> getpref() async {
  SharedPreferences Preferences = await SharedPreferences.getInstance();
  if (Preferences.getBool("vir") == true) {
    return true;
  } else {
    return false;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String emails, passwords;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en'), // English
        Locale('ar', 'AE'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Rover.sci',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: login(context),
    );
  }

  Widget login(BuildContext context) {
    if (getpref() == 'true') {
      print(getpref());
      return const home_page();
    } else if (getpref() == 'false') {
      print(getpref());
      return const SignIn();
    } else {
      print(getpref());
      return const SignIn();
    }
  }
}
