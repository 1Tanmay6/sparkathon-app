import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

import '../widgets/videoPage_widget.dart';

class VideoFeedScreen extends StatefulWidget {
  final List content;
  final int contentSize;
  final double swipeThreshold;
  final double swipeVelocityThreshold;
  final Duration animationDuration;
  final String Function(int index) videoUrlBuilder;

  const VideoFeedScreen({
    Key? key,
    required this.content,
    required this.contentSize,
    required this.swipeThreshold,
    required this.swipeVelocityThreshold,
    required this.animationDuration,
    required this.videoUrlBuilder,
  }) : super(key: key);

  @override
  _VideoFeedScreenState createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.contentSize,
      itemBuilder: (BuildContext context, int index) {
        return VideoPage(
          video: widget.content[index],
          videoUrl: widget.videoUrlBuilder(index),
        );
      },
    );
  }
}
