import 'package:flutter/material.dart';
import 'package:pdf_reader_app/jus/parts.dart';
import 'package:pdf_reader_app/jus/csave.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screen/links.dart';

class kahf extends StatefulWidget {
  const kahf({super.key});

  @override
  State<kahf> createState() => _kahf();
}

class _kahf extends State<kahf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
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
          title: const Text(
            'سورة الكهف',
          ),
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: part.length,
                itemBuilder: (context, index) => csave(
                  itemIndex: index,
                  part: part[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
