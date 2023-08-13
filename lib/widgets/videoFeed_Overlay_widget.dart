import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';

import '../models/Video.dart';
import '../widgets/bottomModal_widget.dart';
import '../providers/content_provider.dart';

class VideoFeedOverlayWidget extends StatefulWidget {
  final Video video;
  VideoFeedOverlayWidget({required this.video});

  @override
  State<VideoFeedOverlayWidget> createState() => _VideoFeedOverlayWidgetState();
}

class _VideoFeedOverlayWidgetState extends State<VideoFeedOverlayWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Provider.of<ContentProvider>(context, listen: false)
                      .likesIncrementer(widget.video.id);
                },
                icon: Column(
                  children: [
                    Icon(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                      Icons.thumb_up_rounded,
                      size: 30,
                      color: colorScheme.onPrimary,
                    ),
                    Text(
                      widget.video.likes.toInt().toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: MediaQuery.of(context).size.height * 0.011,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )),
            IconButton(
                onPressed: () {
                  Provider.of<ContentProvider>(context, listen: false)
                      .dislikesIncrementer(widget.video.id);
                },
                icon: Column(
                  children: [
                    Icon(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                      Icons.thumb_down_alt_rounded,
                      size: 30,
                      color: colorScheme.onPrimary,
                    ),
                    Text(
                      widget.video.dislikes.toInt().toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: MediaQuery.of(context).size.height * 0.011,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )),
            IconButton(
                onPressed: () => showMaterialModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          ModalFit(comments: widget.video.comments),
                    ),
                icon: Column(
                  children: [
                    Icon(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                      Bootstrap.chat_dots_fill,
                      size: 30,
                      color: colorScheme.onPrimary,
                    ),
                    Text(
                      widget.video.comments.length.toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: MediaQuery.of(context).size.height * 0.011,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )),
            IconButton(
                onPressed: () {},
                icon: Column(
                  children: [
                    Icon(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                      FontAwesome.share,
                      size: 30,
                      color: colorScheme.onPrimary,
                    )
                  ],
                )),
          ],
        ));
  }
}
