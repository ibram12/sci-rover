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
   runApp(await MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  bool vil = false;
  getpref() async {
    SharedPreferences Preferences = await SharedPreferences.getInstance();
    vil = Preferences.getBool("vir")!;
    return vil;
  }
  void initState() {
    // TODO: implement initState

   getpref();
  }

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

    switch (getpref()) {
      case 'true':
        return home_page();
      s
    }
  }
}
