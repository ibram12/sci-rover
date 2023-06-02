import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/dataRover.dart';

// ignore: camel_case_types
class carrd extends StatelessWidget {
  const carrd({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final dataRover product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 190,
      child: InkWell(
        onTap: () {
          press();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 25,
                        color: Colors.black),
                  ]),
            ),
            Positioned(
                top: 0.0,
                left: 0.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 160,
                  width: 200,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
                bottom: 0.0,
                right: 0.0,
                child: SizedBox(
                  height: 136,
                  width: size.width - 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          product.subTitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
