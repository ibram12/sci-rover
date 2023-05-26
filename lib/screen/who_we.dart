import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/carrd.dart';
import 'package:pdf_reader_app/screen/product.dart';

import '../widget/card_links_college.dart';
import 'DetailsScreen.dart';

// ignore: camel_case_types
class who_we extends StatefulWidget {
  const who_we({Key? key}) : super(key: key);

  @override
  State<who_we> createState() => _who_weState();
}

// ignore: camel_case_types
class _who_weState extends State<who_we> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          title: const Text('جوالة كلية العلوم'),
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
                itemBuilder: (context, index) => carrd(
                  itemIndex: index,
                  product: products[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
