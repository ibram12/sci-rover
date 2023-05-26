import 'package:flutter/material.dart';
import 'package:pdf_reader_app/jus/parts.dart';
import 'package:pdf_reader_app/jus/csave.dart';

import '../widget/card_links_college.dart';

class mathamer extends StatefulWidget {
  const mathamer({super.key});

  @override
  State<mathamer> createState() => _mathamer();
}

class _mathamer extends State<mathamer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title: const Text(
            'مزامير مسيحية',
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
                itemCount: part4.length,
                itemBuilder: (context, index) => csave(
                  itemIndex: index,
                  part: part4[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
