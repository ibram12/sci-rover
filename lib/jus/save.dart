import 'package:pdf_reader_app/jus/esra.dart';
import 'package:pdf_reader_app/jus/marim.dart';
import 'package:pdf_reader_app/jus/taha.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screen/links.dart';
import 'kahf.dart';

class save extends StatefulWidget {
  const save({super.key});

  @override
  State<save> createState() => _saveState();
}

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
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
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
            ],
          ),
        ),
      ),
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