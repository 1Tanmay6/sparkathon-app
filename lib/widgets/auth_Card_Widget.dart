import 'package:flutter/material.dart';

import 'auth_card_overlay_widget.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'lib/assets/images/bg.png',
            fit: BoxFit.cover,
          ),
        ),
        const AuthCardOverlayWidget()
      ],
    );
  }
}
