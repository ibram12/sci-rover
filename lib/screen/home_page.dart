import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf_reader_app/screen/Sign/Sign_In.dart';
import 'package:pdf_reader_app/screen/learn.dart';
import 'package:pdf_reader_app/screen/photo_rover.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/videos/sammer.dart';
import 'package:pdf_reader_app/screen/who_we.dart';
import 'package:pdf_reader_app/widget/card_home_page.dart';
import 'package:pdf_reader_app/widget/card_links_college.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_sign_in/google_sign_in.dart';
import '../jus/jus.dart';
import 'notv.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<String> title = [
    'هيكل العشيرة',
    'الدرع الكشفي',
    'الدرع الديني',
    'معرض علوم ',
    'درع السمر'
  ];
  List<Widget> page = const [who_we(), learn(), jus(), photo_rover(), Sammer()];
  List<IconData> icon = [
    Icons.question_mark,
    Icons.auto_stories_rounded,
    Icons.book,
    Icons.photo,
    Icons.auto_stories_rounded,
  ];
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  var fbm = FirebaseMessaging.instance;
  topic() async {
    await FirebaseMessaging.instance.subscribeToTopic('aaa');
  }

  var serverToken =
      "AAAAQtml3n4:APA91bEf2KQ18JtXxRaYviKfBxtwIVwp8rdhkJJ5bPQkC8iv9cFdzTH9z18htVR3yDz_ndCbf3dv0TMGWYIj6fTSj_sp1fr_g7kxQUJdUw6zKg0sMHYLwRaqlpO3CUeSAdE_hBJ0jBGx";
  sendNot(String title, String body) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': body, 'title': title},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          },
          'to': await FirebaseMessaging.instance.getToken(),
        },
      ),
    );
  }

  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool('vir') == null ||
        preferences.getBool('vir') == false) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, setState) => const SignIn(),
          ),
        ),
      );
    }
  }

  Widget create() {
    return SafeArea(
      child: Column(
        children: [
          const Image(
            image: AssetImage('images/h1.jpg'),
            width: double.infinity,
            height: 255,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return cardHomePage(
                    title: title[index], page: page[index], icon: icon[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  massag() async {
    FirebaseMessaging.onMessage.listen((event) {
      AwesomeDialog(
          context: context,
          title: "${event.notification!.title}",
          body: Text(
            "${event.notification!.body}",
            textAlign: TextAlign.center,
          )).show();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getpref();
    topic();
    massag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 5,
            title: const Text(
              'Rover.sci',
            ),
            // actions: [
            //   IconButton(
            //     padding: const EdgeInsets.only(right: 20),
            //     icon: const Icon(
            //       Icons.notifications_active,
            //       color: Colors.black,
            //       // size: 35,
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (BuildContext context) => StatefulBuilder(
            //               builder: (BuildContext context, setState) =>
            //                   const notv())));
            //     },
            //   ),
            // ],
            centerTitle: true,
            backgroundColor: Colors.amber),
        drawer: const cardDrawer(),
        body: create());
  }
}
