import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class notv extends StatefulWidget {
  const notv({super.key});

  @override
  State<notv> createState() => _notvState();
}

class _notvState extends State<notv> {
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
          'to': "/topics/aaa",
        },
      ),
    );
  }

  late String titla;
  late String bady;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 5,
            title: const Text(
              'ارسال الاشعارات',
            ),
            centerTitle: true,
            backgroundColor: Colors.amber),
        body: SafeArea(
            child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    titla = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "عنوان الاشعار",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    bady = value;
                  },
                  decoration: const InputDecoration(
                    hintText: "الاشعار",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () async {
                    sendNot(titla, "$bady ");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontStyle: FontStyle.normal),
                  ),
                  child: const Text('ارسال الاشعار'),
                ),
              ],
            ),
          ),
        )));
  }
}
