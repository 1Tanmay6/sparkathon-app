import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/videoFeed_Overlay_widget.dart';
import '../widgets/GlassomorphicCapsule_widget.dart';
import '../models/Video.dart';

class VideoPage extends StatefulWidget {
  final Video video;
  final String videoUrl;

  const VideoPage({
    Key? key,
    required this.video,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    loading = false;
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(children: [
      SizedBox.expand(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.15)
            ])),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
            // color: Colors.amber,
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.17,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 6,
                    child: VideoFeedOverlayWidget(video: widget.video)),
                const Expanded(flex: 4, child: GlassomorphicCapsuleWidget()),
              ],
            )),
      ),
      Positioned(
        left: 0,
        bottom: 0,
        child: FittedBox(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.video.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onPrimary),
                                    ),
                                    Text(
                                      '\$${widget.video.price}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: colorScheme.onPrimary),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.star_rounded,
                                  size: 30,
                                ),
                                Text(
                                  '${widget.video.rating}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: colorScheme.onPrimary),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
