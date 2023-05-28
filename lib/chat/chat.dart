import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader_app/chat/masseges.dart';
import 'package:pdf_reader_app/screen/Sign/Sign_In.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/card_links_college.dart';
import '../widget/custom_Card_chat.dart';

class roverChat extends StatefulWidget {
  const roverChat({super.key, required this.email1});
  final String email1;

  @override
  State<roverChat> createState() => _roverChatState();
}

class _roverChatState extends State<roverChat> {
  TextEditingController controller = TextEditingController();

  late CollectionReference mass;
  late String massege;
  var email;
  void initState() {
    // TODO: implement initState
    getpref();
    mass = FirebaseFirestore.instance
        .collection('masseges')
        .doc(widget.email1)
        .collection('masseges1');
    super.initState();
  }

  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    return email;
  }

  Future<void> addmass(massege) async {
    if (email != null) {
      CollectionReference mass = FirebaseFirestore.instance
          .collection('masseges')
          .doc(email)
          .collection('masseges1');
      mass
          .add({
            'massege': massege,
            'timenow': DateTime.now(),
            'email': email,
          })
          .then((value) => print("massege Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => StatefulBuilder(
              builder: (BuildContext context, setState) => SignIn())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: mass.orderBy('timenow', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Massege> massegeslist = [];

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              massegeslist.add(Massege.fromJSON(snapshot.data!.docs[i]));
            }
            print(massegeslist);
            return Scaffold(
              appBar: AppBar(
                  elevation: 5,
                  title: const Text(
                    'اسئل الجوالة',
                    style: TextStyle(color: Colors.brown),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.amber),
              drawer: const cardDrawer(),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: massegeslist.length,
                      itemBuilder: (context, index) {
                        return massegeslist[index].email == widget.email1
                            ? customCardChatfri(
                                mass: massegeslist[index].massege,
                              )
                            : customCardChat(
                                mass: massegeslist[index].massege,
                              );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        massege = value;
                      },
                      onSubmitted: (massege) {
                        addmass(massege);
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'اكتب الرسالة',
                        suffixIcon: IconButton(
                          onPressed: () {
                            addmass(massege);
                            controller.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.brown,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('اتصل بالانترنت'),
              ),
            );
          }
        });
  }
}
