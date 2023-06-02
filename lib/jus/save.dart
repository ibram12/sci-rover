import 'package:pdf_reader_app/jus/esra.dart';
import 'package:pdf_reader_app/jus/marim.dart';
import 'package:pdf_reader_app/jus/taha.dart';
import 'package:flutter/material.dart';

import '../widget/card_links_college.dart';
import 'kahf.dart';

// ignore: camel_case_types
class save extends StatefulWidget {
  const save({super.key});

  @override
  State<save> createState() => _saveState();
}

// ignore: camel_case_types
class _saveState extends State<save> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'القران الكريم',
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(
                Icons.arrow_right,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.amber),
      drawer: const cardDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                  child: SizedBox(
                height: 120,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context, setState) =>
                                  const kahf())));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "سورة الكهف",
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
                height: 100,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context, setState) =>
                                  const esra())));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "سورة الاسراء",
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
                height: 100,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context, setState) =>
                                  const marim())));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "سورة مريم",
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
                height: 100,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context, setState) =>
                                  const taha())));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "سورة طه",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    )),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
