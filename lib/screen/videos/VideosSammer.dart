import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosSammer extends StatefulWidget {
  const VideosSammer({
    Key? key,
    required this.links,
    required this.namelinks,
    required this.titles,
    required this.image,
  }) : super(key: key);

  final List<dynamic> links;
  final List<dynamic> namelinks;
  final String titles;
  final String image;

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
                    height: 270,
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Science rover 4 ever',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            widget.titles,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 280,
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent,
                          onEnded: (metaData) {
                            setState(() {
                              if (_player == true) {
                                _player = false;
                              } else {
                                _player = true;
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
                    _player == false
                        ? const SizedBox(
                            height: 20,
                          )
                        : const SizedBox(),
                    _player == false
                        ? Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.titles,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.links.length,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () async {
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
                                flags: const YoutubePlayerFlags(
                                  mute: false,
                                  autoPlay: true,
                                  disableDragSeek: false,
                                  loop: false,
                                  isLive: false,
                                  forceHD: false,
                                  hideThumbnail: true,
                                ),
                              );
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
                                        image: NetworkImage(
                                          widget.image,
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
                                        widget.namelinks[index],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
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
    return Scaffold(body: create());
  }
}
