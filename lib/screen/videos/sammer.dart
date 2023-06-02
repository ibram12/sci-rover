import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/videos/dataSammer.dart';

import '../../widget/card_sammer.dart';
import 'VideosSammer.dart';

class Sammer extends StatefulWidget {
  const Sammer({super.key});

  @override
  State<Sammer> createState() => _SammerState();
}

class _SammerState extends State<Sammer> {
  // Import the permission_handler package
  CollectionReference mass = FirebaseFirestore.instance.collection('sammer');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: mass.orderBy('timenow').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dataSammer> massegeslist = [];

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              massegeslist.add(dataSammer.fromJSON(snapshot.data!.docs[i]));
            }
            print(massegeslist);

            return Scaffold(
              body: SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.orange,
                    ],
                    begin: FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight,
                  )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: Center(
                          child: Column(
                            children: const [
                              SizedBox(height: 20),
                              Text(
                                'Science rover 4 ever',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'اسمار علوم',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: massegeslist.length,
                                  itemBuilder: (context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                StatefulBuilder(
                                              builder: (BuildContext context,
                                                      setState) =>
                                                  VideosSammer(
                                                links:
                                                    massegeslist[index].links,
                                                namelinks: massegeslist[index]
                                                    .namelinks,
                                                titles:
                                                    massegeslist[index].title,
                                                image:
                                                    massegeslist[index].image,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: cardSammer(
                                          title: massegeslist[index].title,
                                          subTitle:
                                              massegeslist[index].subTitle,
                                          image: massegeslist[index].image),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
