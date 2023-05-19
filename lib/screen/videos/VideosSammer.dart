import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../lists/LinkVideos.dart';
import '../links.dart';

class VideosSammer extends StatefulWidget {
  const VideosSammer({
    Key? key,
    required this.links,
    required this.namelinks,
    required this.titles,
  }) : super(key: key);

  final List<String> links;
  final List<String> namelinks;
  final String titles;

  @override
  State<VideosSammer> createState() => _VideosSammerState();
}

class _VideosSammerState extends State<VideosSammer> {
  late YoutubePlayerController _controller;
  bool _player = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // _playerview(BuildContext context) {}

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
            _player == false
                ? Container(
                    height: 250,
                  )
                : Container(
                    height: 250,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      onEnded: (metaData) {
                        setState(() {
                          if (_player == true) {
                            _player = false;
                          }
                        });
                      },
                    )),
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
                    _player == false
                        ? SizedBox(
                            height: 20,
                          )
                        : SizedBox(),
                    _player == false
                        ? Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.titles,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.links.length,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_player == false) {
                                  _player = true;
                                } else {
                                  _player = false;
                                }
                              });
                              _controller = YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    widget.links[index])!,
                                flags:
                                    const YoutubePlayerFlags(autoPlay: false),
                              );
                            },
                            child: SizedBox(
                              height: 100,
                              // width: 200,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          linkVideos[1].image,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.namelinks[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.0),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        // elevation: 5,
        // title:   Text(
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
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  color: Colors.amber,
                  child: Center(
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
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          height: 70,
                          child: Row(
                            children: [
                              Icon(
                                Icons.link,
                                color: Colors.brown,
                              ),
                              SizedBox(width: 0),
                              TextButton(
                                onPressed: () async {
                                  if (!await launchUrl(
                                    Uri(
                                        scheme: links[index].scheme,
                                        host: links[index].host,
                                        path: links[index].path),
                                    mode: LaunchMode.externalApplication,
                                    webViewConfiguration: WebViewConfiguration(
                                        enableJavaScript: false),
                                  )) {
                                    throw 'Could not launch $Uri';
                                  }
                                },
                                child: Text(
                                  links[index].name,
                                  style: TextStyle(
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
