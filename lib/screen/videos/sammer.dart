import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../lists/LinkVideos.dart';
import '../links.dart';
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
                              // width: 200,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
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
    return Scaffold(
        // appBar: AppBar(
        // elevation: 5,
        // title: const Text(
        //   'درع السمر',
        // ),
        // centerTitle: true,
        // backgroundColor: Colors.amber

        // ),

        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  color: Colors.amber,
                  child: const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 70.0,
                      backgroundImage: AssetImage("images/2022.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: links.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          height: 70,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.link,
                                color: Colors.brown,
                              ),
                              const SizedBox(width: 0),
                              TextButton(
                                onPressed: () async {
                                  if (!await launchUrl(
                                    Uri(
                                        scheme: links[index].scheme,
                                        host: links[index].host,
                                        path: links[index].path),
                                    mode: LaunchMode.externalApplication,
                                    webViewConfiguration:
                                        const WebViewConfiguration(
                                            enableJavaScript: false),
                                  )) {
                                    throw 'Could not launch $Uri';
                                  }
                                },
                                child: Text(
                                  links[index].name,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.brown),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
        body: create());
  }
}
