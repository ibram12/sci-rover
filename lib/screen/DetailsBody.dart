import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/dataRover.dart';

import 'product_image.dart';

class DetailsBody extends StatelessWidget {
  final dataRover product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the sceen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProductImage(
                    size: size,
                    image: product.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    ' ${product.subTitle}',
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20 / 2),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20 / 2,
            ),
            child: Center(
              child: Text(
                product.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
