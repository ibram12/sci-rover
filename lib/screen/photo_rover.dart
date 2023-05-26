import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/mf.dart';

import '../widget/card_links_college.dart';

import 'm21.dart';

class photo_rover extends StatefulWidget {
  const photo_rover({super.key});

  @override
  State<photo_rover> createState() => _photo_roverState();
}

class _photo_roverState extends State<photo_rover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'معرض علوم',
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
            children: [
              Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 25,
                              color: Colors.black),
                        ]),
                    width: double.infinity,
                    height: 300,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StatefulBuilder(
                                      builder:
                                          (BuildContext context, setState) =>
                                              const m21())));
                        },
                        child: Column(
                          children: const [
                            Image(
                              image: AssetImage('images/m21.jpg'),
                              height: 240,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "معرض علوم 2021",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.brown,
                              ),
                            ),
                          ],
                        )),
                  )),
              Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 25,
                              color: Colors.black),
                        ]),
                    width: double.infinity,
                    height: 300,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StatefulBuilder(
                                      builder:
                                          (BuildContext context, setState) =>
                                              const mf())));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Image(
                              image: AssetImage('images/m22.jpg'),
                              height: 220,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "معرض علوم 2022",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.brown,
                              ),
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
