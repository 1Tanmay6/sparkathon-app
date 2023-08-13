import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/auth_Card_Widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthCard());
  }
}
