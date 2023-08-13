import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final authProvider = Provider.of<AuthServices>(context);
    return SafeArea(
      child: SizedBox.expand(
          child: Container(
        color: Theme.of(context).colorScheme.onBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: media.height * 0.1,
              child: InkWell(
                onTap: () {
                  authProvider.signOut(context);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: colorScheme.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Logout',
                          style: textTheme.bodyMedium!.copyWith(
                              fontSize: 15, color: colorScheme.primary),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: media.height * 0.22,
              width: double.maxFinite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              authProvider.user!.photoURL.toString()),
                          radius: media.height * 0.065,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(authProvider.user!.displayName!,
                            style: textTheme.displayLarge!.copyWith(
                                fontSize: 20, color: colorScheme.primary)),
                        IconButton(
                            onPressed: () {},
                            icon: Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.transparent),
                                child: Icon(
                                  Icons.edit,
                                  color: colorScheme.primary,
                                ))),
                      ],
                    ),
                    Text(authProvider.user!.email!,
                        style: textTheme.displayLarge!.copyWith(
                            fontSize: 13,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            Divider(
              color: colorScheme.primary,
              thickness: 1,
              indent: 80,
              endIndent: 80,
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/auth');
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colorScheme.primary.withOpacity(0.3),
                            width: 1,
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: colorScheme.primary.withOpacity(0.2),
                          //     spreadRadius: 0.5,
                          //     blurRadius: 5,
                          //     offset: const Offset(
                          //         0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        alignment: Alignment.center,
                        height: media.height * 0.05,
                        width: media.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: colorScheme.onSurface,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Wishlist',
                              style: textTheme.bodyMedium!.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/auth');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colorScheme.primary.withOpacity(0.3),
                            width: 1,
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: colorScheme.primary.withOpacity(0.2),
                          //     spreadRadius: 0.5,
                          //     blurRadius: 5,
                          //     offset: const Offset(
                          //         0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        alignment: Alignment.center,
                        height: media.height * 0.05,
                        width: media.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.history,
                              color: colorScheme.onSurface,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Orders',
                              style: textTheme.bodyMedium!.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/auth');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colorScheme.primary.withOpacity(0.3),
                            width: 1,
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: colorScheme.primary.withOpacity(0.2),
                          //     spreadRadius: 0.5,
                          //     blurRadius: 5,
                          //     offset: const Offset(
                          //         0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        alignment: Alignment.center,
                        height: media.height * 0.05,
                        width: media.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dark_mode,
                              color: colorScheme.onSurface,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Dark Mode',
                              style: textTheme.bodyMedium!.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/auth');
                    },
                    child: Container(
                        decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colorScheme.onPrimary.withOpacity(0.5),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        height: media.height * 0.05,
                        width: media.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              color: colorScheme.onPrimary.withOpacity(0.9),
                              Iconsax.magic_star,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Become a Creator',
                              style: textTheme.bodyMedium!.copyWith(
                                color: colorScheme.onPrimary.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.height * 0.15,
            )
          ],
        ),
      )),
    );
  }
}
