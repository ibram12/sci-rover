import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/product.dart';

import 'DetailsBody.dart';
class  DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.amber,
      appBar: detailsAppBar(context),
      body:

      DetailsBody(
        product: product,
      ),

    );
  }
  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(right: 20),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'رجوع',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

