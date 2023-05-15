import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/ppdf.dart';
import 'package:url_launcher/url_launcher.dart';

import 'links.dart';

class learn extends StatefulWidget {
  const learn({super.key});

  @override
  State<learn> createState() => _learnState();
}

class _learnState extends State<learn> {
  List<String> pdfs = [
    "الحركة الكشفية.pdf",
    "النحية الكشفية .pdf",
    "الزي الكشفي .pdf",
    "الاسعافات الاولية.pdf",
    "عقد وربطات.pdf",
    "تقاليد الأعلام.pdf",
    "النيران.pdf",
    "الملاحة البرية .pdf",
    "الشمالات.pdf",
    "الشارات.pdf",
    "السيمافور.pdf",
    "الرحلة الخلوية.pdf",
    "التخطيط.pdf",
    "البلطة.pdf",
  ];
  List<String> texts = [
    "الحركة الكشفية ",
    "النحية الكشفية",
    "الزي الكشفي",
    "الاسعافات الاولية",
    "عقد وربطات",
    "تقاليد الأعلام",
    "النيران",
    "الملاحة البرية",
    "الشمالات",
    "الشارات",
    "السيمافور",
    "الرحلة الخلوية",
    "التخطيط",
    "البلطة",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'الدرع الكشفي',
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
        child: ListView.builder(
          itemCount: texts.length,
          itemBuilder: ((context, index) {
            return Card(
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
                            offset: Offset(0, 0),
                            blurRadius: 25,
                            color: Colors.black),
                      ]),
                  height: 70,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => StatefulBuilder(
                                builder: (BuildContext context, setState) =>
                                    PDFReaderApp(
                                      path: pdfs[index],
                                      title: texts[index],
                                    ))));
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.flag_outlined,
                            color: Colors.brown,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            texts[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      )),
                ));
          }),
        ),
      ),
    );
  }
}
