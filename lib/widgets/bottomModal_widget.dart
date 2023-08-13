import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../models/Comment.dart';

class ModalFit extends StatefulWidget {
  final List<Comment> comments;
  ModalFit({
    required this.comments,
  });

  @override
  State<ModalFit> createState() => _ModalFitState();
}

class _ModalFitState extends State<ModalFit> {
  @override
  Widget build(BuildContext context) {
    bool liked = false;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
        color: Colors.transparent,
        child: SafeArea(
          top: false,
          minimum: const EdgeInsets.all(8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.005,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: MediaQuery.of(context).size.height * 0.61,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('Comments',
                            style: TextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontFamily: 'Montserrat')),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Expanded(
                        flex: 20,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: widget.comments.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 20),
                                    leading: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1568572933382-74d440642117?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80'), // Replace with the actual image URL
                                    ),
                                    title: Text(widget.comments[index].author,
                                        style: TextStyle(
                                            color: colorScheme.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            fontFamily: 'Montserrat')),
                                    subtitle: Text(
                                      widget.comments[index].text,
                                      style: TextStyle(
                                          color: colorScheme.primary,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            liked = !liked;
                                          });
                                        },
                                        icon: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              liked
                                                  ? Bootstrap.heart_fill
                                                  : Bootstrap.heart,
                                              color: colorScheme.surface,
                                            ),
                                            Text(
                                              '8080',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.011,
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme.primary,
                                              ),
                                            ),
                                          ],
                                        ))),
                                Divider(
                                  color: colorScheme.primary.withOpacity(0.4),
                                  thickness: 1,
                                  indent: 80,
                                  endIndent: 80,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
