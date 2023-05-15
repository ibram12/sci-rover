import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf_reader_app/screen/Sign/Sign_Up.dart';
import 'package:pdf_reader_app/screen/learn.dart';
import 'package:pdf_reader_app/screen/photo_rover.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/who_we.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../jus/jus.dart';

import 'links.dart';
import 'notv.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
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

  Widget create() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage('images/h1.jpg'),
              width: double.infinity,
              height: 255,
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: Shield.length,
            //     itemBuilder: ((context, index) {
            //       return Card(
            //         child: SizedBox(
            //           height: 90,
            //           child: TextButton(
            //             onPressed: () {
            //               Navigator.of(context).push(
            //                 MaterialPageRoute(
            //                   builder: (BuildContext context) =>
            //                       StatefulBuilder(
            //                     builder: (BuildContext context, setState) =>
            //                         Shield[index].page,
            //                   ),
            //                 ),
            //               );
            //             },
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   Shield[index].image,
            //                   color: Colors.brown,
            //                 ),
            //                 const SizedBox(width: 20),
            //                 Text(
            //                   Shield[index].title,
            //                   style: const TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 30,
            //                     color: Colors.brown,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            Card(
                child: SizedBox(
              height: 90,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context, setState) =>
                                const who_we())));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.question_mark,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "هيكل الوفد",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  )),
            )),
            Card(
              child: SizedBox(
                height: 90,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context, setState) =>
                                const learn())));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.auto_stories_rounded,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "الدرع الكشفي",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
                child: SizedBox(
              height: 90,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context, setState) =>
                                const jus())));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.book,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "الدرع الديني",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  )),
            )),
            Card(
                child: SizedBox(
              height: 90,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context, setState) =>
                                const photo_rover())));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.photo,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "معرض علوم",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  )),
            )),
            Card(
              child: SizedBox(
                height: 90,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.auto_stories_rounded,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "درع السمر",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    topic();
    FirebaseMessaging.onMessage.listen((event) {
      AwesomeDialog(
          context: context,
          title: "${event.notification!.title}",
          body: Text(
            "${event.notification!.body}",
            textAlign: TextAlign.center,
          )).show();
    });
    super.initState();
    // signInWithGoogle();
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
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  color: Colors.amber,
                  child: const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 70.0,
                      backgroundImage: AssetImage("images/2022.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: links.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          height: 70,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.link,
                                color: Colors.brown,
                              ),
                              const SizedBox(width: 0),
                              TextButton(
                                onPressed: () async {
                                  if (!await launchUrl(
                                    Uri(
                                        scheme: links[index].scheme,
                                        host: links[index].host,
                                        path: links[index].path),
                                    mode: LaunchMode.externalApplication,
                                    webViewConfiguration:
                                        const WebViewConfiguration(
                                            enableJavaScript: false),
                                  )) {
                                    throw 'Could not launch $Uri';
                                  }
                                },
                                child: Text(
                                  links[index].name,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.brown),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      var cred = await signInWithGoogle();

                      topic();
                      sendNot("عشيرة علوم", "تم التسجيل ");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontStyle: FontStyle.normal),
                    ),
                    child: const Text('sign in by Google'),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: create());
  }
}
