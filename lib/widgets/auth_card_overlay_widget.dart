import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';

import '../providers/auth_provider.dart';

class AuthCardOverlayWidget extends StatelessWidget {
  const AuthCardOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontWeight: FontWeight.bold, fontSize: 12);

    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/assets/images/logo.png', height: 75, width: 75),
              const Text(
                textAlign: TextAlign.center,
                'Your gateway to new standards of shopping',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Get started now!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 100)).then(
                      (value) => print(
                          Provider.of<AuthServices>(context, listen: false)
                              .signInWithGoogle(context)));
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(
                      MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                ),
                icon: const Icon(Bootstrap.google),
                label: Text(
                  'Login with Google',
                  style: style,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(
                      MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                ),
                icon: const Icon(Bootstrap.facebook),
                label: Text(
                  'Login with Facebook',
                  style: style,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(
                      MediaQuery.of(context).size.width * 0.55,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)),
                ),
                icon: const Icon(Bootstrap.telephone_fill),
                label: Text(
                  'Login with Phone',
                  style: style,
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(0)),
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.onPrimary),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          MediaQuery.of(context).size.width * 0.55,
                          MediaQuery.of(context).size.height * 0.05,
                        ),
                      )),
                  onPressed: () {},
                  child: Container(
                    child: Text(
                      'Create an Account',
                      style: style,
                    ),
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.height * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.9),
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.7),
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.6),
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.7),
                            Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.9),
                          ]),
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
