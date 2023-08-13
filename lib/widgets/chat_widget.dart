import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/chatUser.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    List<ChatMessage> messages = [
      ChatMessage(
          messageContent: "Hey Maya, did you see my latest Instagram post?",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "Yes, I did! That blue saree you're wearing looks absolutely stunning.",
          messageType: "sender"),
      ChatMessage(
          messageContent:
              "Thank you! It's one of my favorite sarees. The shade of blue is so captivating.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "I agree, it complements your complexion really well. Where did you get it?",
          messageType: "sender"),
      ChatMessage(
          messageContent:
              "I actually got it from a local designer boutique. They had a limited collection.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "Lucky find! The intricate embroidery on the saree adds an elegant touch.",
          messageType: "sender"),
      ChatMessage(
          messageContent:
              "Exactly! I fell in love with the details as soon as I saw it.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "We should plan a traditional wear day and both wear our favorite sarees.",
          messageType: "sender"),
      ChatMessage(
          messageContent:
              "That sounds like a fantastic idea! Let's set a date for it.",
          messageType: "receiver"),
      ChatMessage(
          messageContent:
              "How about this Saturday? We can have a mini photoshoot too.",
          messageType: "sender"),
      ChatMessage(
          messageContent:
              "Saturday it is! I'm excited to see you rock that blue saree again.",
          messageType: "receiver"),
    ];
    return Scaffold(
      backgroundColor: colorScheme.onPrimary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorScheme.onPrimary,
        flexibleSpace: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(
            right: 16,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('lib/assets/images/user1.png'),
                maxRadius: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Adam Yau",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.settings,
                color: Colors.black54,
              )
            ],
          ),
        )),
      ),
      body: content(messages, colorScheme),
    );
  }

  Widget content(List<ChatMessage> message, ColorScheme colorScheme) {
    return Column(
      children: [
        //chat bubble view
        Expanded(
          child: Stack(children: [
            SizedBox.expand(
              child: Image.asset(
                'lib/assets/images/chat_bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                // Make the container transparent so the blur is visible
                color: Colors.transparent,
                child: Container(), // Your chat interface goes here
              ),
            ),
            ListView.builder(
                itemCount: message.length,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: message[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (message[index].messageType == "receiver")
                                ? colorScheme.onPrimary.withOpacity(0.75)
                                : colorScheme.surface.withOpacity(0.75)),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          message[index].messageContent,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                })),
          ]),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: double.infinity,
            color: colorScheme.onPrimary,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.add,
                    color: colorScheme.onPrimary,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none),
                )),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.send,
                    color: colorScheme.onPrimary,
                    size: 18,
                  ),
                  backgroundColor: colorScheme.surface,
                  elevation: 0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
