import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class GlassomorphicCapsuleWidget extends StatefulWidget {
  const GlassomorphicCapsuleWidget({super.key});

  @override
  State<GlassomorphicCapsuleWidget> createState() =>
      _GlassomorphicCapsuleWidgetState();
}

class _GlassomorphicCapsuleWidgetState
    extends State<GlassomorphicCapsuleWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          // width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white60,
              width: 2,
            ),
            color: colorScheme.primary.withOpacity(0.6),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                iconSize: 30,
                icon: const Icon(Icons.shopping_bag_outlined),
                color: colorScheme.onPrimary,
                onPressed: () {},
              ),
              IconButton(
                iconSize: 25,
                icon: const Icon(FontAwesome.heart),
                onPressed: () {},
                color: colorScheme.onPrimary,
              ),
              IconButton(
                iconSize: 25,
                icon: const Icon(FontAwesome.info),
                onPressed: () {},
                color: colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
