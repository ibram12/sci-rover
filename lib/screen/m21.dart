import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/phot.dart';
import 'package:url_launcher/url_launcher.dart';

import 'carrrd.dart';
import 'links.dart';

class m21 extends StatefulWidget {
  const m21({Key? key}) : super(key: key);

  @override
  State<m21> createState() => _m21State();
}

class _m21State extends State<m21> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          title: const Text('معرض علوم 2021'),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(
                Icons.arrow_right_alt_sharp,
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
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: products2.length,
                itemBuilder: (context, index) => carrrd(
                  itemIndex: index,
                  phot: products2[index],
                  press: () {},
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
