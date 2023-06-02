import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pdf_reader_app/jus/parts.dart';

// ignore: camel_case_types
class csave extends StatefulWidget {
  const csave({
    Key? key,
    required this.itemIndex,
    required this.part,
  }) : super(key: key);
  final int itemIndex;
  final parts part;

  @override
  State<csave> createState() => _csave();
}

// ignore: camel_case_types
class _csave extends State<csave> {
  final player = AudioPlayer();
  Duration cur = const Duration();
  Duration mus = const Duration();
  bool isplaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.setSourceUrl(widget.part.loc);
    setup();
  }

  setup() {
    player.onPositionChanged.listen((d) {
      setState(() {
        cur = d;
      });
      player.onDurationChanged.listen((d) {
        setState(() {
          mus = d;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 10, start: 10),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (isplaying) {
                      setState(() {
                        isplaying = false;
                      });
                      player.pause();
                    } else {
                      setState(() {
                        isplaying = true;
                      });

                      player.play(UrlSource(widget.part.loc));
                    }
                  },
                  icon: isplaying
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
              SizedBox(
                  width: 280,
                  child: Slider(
                      value: cur.inSeconds.toDouble(),
                      max: mus.inSeconds.toDouble(),
                      onChanged: (val) {
                        player.seek(Duration(seconds: val.toInt()));
                      })),
            ],
          ),
          Text(
            widget.part.description,
            style: const TextStyle(
                color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
