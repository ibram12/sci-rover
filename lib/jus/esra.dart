import 'package:flutter/material.dart';
import 'package:pdf_reader_app/jus/parts.dart';
import 'package:pdf_reader_app/jus/csave.dart';
import '../widget/card_links_college.dart';

// ignore: camel_case_types
class esra extends StatefulWidget {
  const esra({super.key});

  @override
  State<esra> createState() => _esra();
}

// ignore: camel_case_types
class _esra extends State<esra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'سورة الاسراء',
          ),
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
            Expanded(
              child: ListView.builder(
                itemCount: part1.length,
                itemBuilder: (context, index) => csave(
                  itemIndex: index,
                  part: part1[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
