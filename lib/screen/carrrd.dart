import 'package:flutter/material.dart';
import 'package:pdf_reader_app/screen/phot.dart';



class carrrd extends StatelessWidget {
  const carrrd({
    Key? key,
    required this.itemIndex,
     required this.phot,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Phot phot;
  final Function press;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 300,
      child:Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 25,
                    color: Colors.black
                ),]
            ),
          ),
          Positioned(
              top: 60.0,

              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 230,
                width: 320,
                child: Image.network(phot.image,fit: BoxFit.cover,),
              )
          ),

        ],
      )  ,
    );
  }
}
