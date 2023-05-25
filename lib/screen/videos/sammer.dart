import 'package:flutter/material.dart';

import '../../lists/LinkVideos.dart';

import 'VideosSammer.dart';

class Sammer extends StatefulWidget {
  const Sammer({super.key});

  @override
  State<Sammer> createState() => _SammerState();
}

class _SammerState extends State<Sammer> {
  Widget create() {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.amber,
            Colors.orange,
          ],
          begin: FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Column(
          children: [
            Container(
              height: 250,
              child: Center(
                child: Column(
                  children: const [
                    SizedBox(height: 20),
                    Text(
                      'Science rover 4 ever',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'اسمار علوم',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: linkVideos.length,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      StatefulBuilder(
                                          builder: (BuildContext context,
                                                  setState) =>
                                              VideosSammer(
                                                links: linkVideos[index].links,
                                                namelinks:
                                                    linkVideos[index].namelinks,
                                                titles: linkVideos[index].title,
                                              ))));
                            },
                            child: SizedBox(
                              height: 100,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          linkVideos[index].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        linkVideos[index].title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 3.0),
                                        child: Text(
                                          linkVideos[index].subTitle,
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: create());
  }
}
