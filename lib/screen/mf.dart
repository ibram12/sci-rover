import 'package:flutter/material.dart';

import 'package:pdf_reader_app/screen/carrrd.dart';
import 'package:pdf_reader_app/screen/phot.dart';

import '../widget/card_links_college.dart';

class mf extends StatefulWidget {
  const mf({Key? key}) : super(key: key);

  @override
  State<mf> createState() => _mfState();
}

class _mfState extends State<mf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          title: const Text('معرض علوم 2022'),
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
                itemCount: products.length,
                itemBuilder: (context, index) => carrrd(
                  itemIndex: index,
                  phot: products[index],
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
