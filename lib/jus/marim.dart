import 'package:flutter/material.dart';
import 'package:pdf_reader_app/jus/parts.dart';
import 'package:pdf_reader_app/jus/csave.dart';

import '../widget/card_links_college.dart';

// ignore: camel_case_types
class marim extends StatefulWidget {
  const marim({super.key});

  @override
  State<marim> createState() => _marim();
}

// ignore: camel_case_types
class _marim extends State<marim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'سورة مريم',
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
                itemCount: part2.length,
                itemBuilder: (context, index) => csave(
                  itemIndex: index,
                  part: part2[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
