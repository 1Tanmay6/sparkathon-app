// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';

import '../widgets/videoPage_widget.dart';

class VideoFeedScreen extends StatefulWidget {
  final List content;
  final int contentSize;
  final double swipeThreshold;
  final double swipeVelocityThreshold;
  final Duration animationDuration;
  final bool shouldBeappbar;
  final String Function(int index) videoUrlBuilder;

  const VideoFeedScreen({
    Key? key,
    required this.content,
    required this.contentSize,
    required this.swipeThreshold,
    required this.swipeVelocityThreshold,
    required this.animationDuration,
    required this.videoUrlBuilder,
    this.shouldBeappbar = false,
  }) : super(key: key);

  @override
  _VideoFeedScreenState createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  final PageController _pageController = PageController();
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: widget.shouldBeappbar
          ? AppBar(
              // title: Text('Video Feed'),
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: colorScheme.onPrimary,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: colorScheme.primary,
                  ),
                ),
              ),
            )
          : null,
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.contentSize,
        itemBuilder: (BuildContext context, int index) {
          return VideoPage(
            video: widget.content[index],
            videoUrl: widget.videoUrlBuilder(index),
          );
        },
      ),
    );
  }
}
