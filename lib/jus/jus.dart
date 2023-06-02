import 'package:flutter/material.dart';
import '../widget/card_links_college.dart';
import 'mathamer.dart';
import 'save.dart';

// ignore: camel_case_types
class jus extends StatefulWidget {
  const jus({super.key});

  @override
  State<jus> createState() => _jusState();
}

// ignore: camel_case_types
class _jusState extends State<jus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'الدرع الديني',
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
                  child: SizedBox(
                height: 100,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => StatefulBuilder(
                              builder: (BuildContext context, setState) =>
                                  const save())));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "القران الكريم",
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
                                  const mathamer())));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.auto_stories_rounded,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "مزامير مسحية ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
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
