import 'package:flutter/material.dart';
import 'package:pdf_reader_app/jus/parts.dart';
import 'package:pdf_reader_app/jus/csave.dart';

import '../widget/card_links_college.dart';

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
      drawer: const cardDrawer(),
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
