import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pdf_reader_app/chat/repmassege.dart';

import '../widget/card_links_college.dart';
import '../widget/card_reply_chat.dart';

// ignore: camel_case_types
class replyChat extends StatefulWidget {
  const replyChat({super.key, required this.email1});
  final String email1;

  @override
  State<replyChat> createState() => _replyChatState();
}

// ignore: camel_case_types
class _replyChatState extends State<replyChat> {
  TextEditingController controller = TextEditingController();
  late CollectionReference getemail =
      FirebaseFirestore.instance.collection('masseges');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: getemail.orderBy('timenow', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<repMassege> massegeslist = [];

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              massegeslist.add(repMassege.fromJSON(snapshot.data!.docs[i]));
            }

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
                        return CardReplyChat(
                          mass: massegeslist[index].email,
                          email: widget.email1,
                        );
                      },
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
