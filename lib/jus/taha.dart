import 'package:flutter/material.dart';
import 'package:pdf_reader_app/jus/csave.dart';
import 'package:pdf_reader_app/jus/parts.dart';

import '../widget/card_links_college.dart';

class taha extends StatefulWidget {
  const taha({super.key});

  @override
  State<taha> createState() => _taha();
}

class _taha extends State<taha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'سورة طه',
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: part3.length,
                itemBuilder: (context, index) => csave(
                  itemIndex: index,
                  part: part3[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
