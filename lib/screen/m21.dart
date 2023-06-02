import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/phot.dart';
import 'package:pdf_reader_app/widget/card_links_college.dart';

import 'carrrd.dart';
import 'links.dart';

// ignore: camel_case_types
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
      drawer: const cardDrawer(),
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
