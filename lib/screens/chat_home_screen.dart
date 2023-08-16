import 'package:flutter/material.dart';
import 'package:sparkathon/widgets/chat_widget.dart';

import '../widgets/conversation_widget.dart';

import '../models/chatUser.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: colorScheme.onPrimary,
        ),
      ),
      backgroundColor: colorScheme.onPrimary,
      body: content(colorScheme, textTheme, context),
    );
  }

  Widget content(colorScheme, textTheme, BuildContext context) {
    List<ChatUsers> chatUsers = [
      ChatUsers(
        name: "Adam Yau",
        messageText: "Awesome Setup",
        imageURL: "lib/assets/images/user1.png",
        time: "Now",
      ),
      ChatUsers(
        name: "Jane Russel",
        messageText: "Welcome !",
        imageURL: "lib/assets/images/user2.png",
        time: "Yesterday",
      ),
      ChatUsers(
        name: "TK",
        messageText: "All the best !",
        imageURL: "lib/assets/images/user3.png",
        time: "31 Jun",
      ),
      ChatUsers(
        name: "Philip Yap",
        messageText: "Let's catch up soon !",
        imageURL: "lib/assets/images/user4.png",
        time: "29 August",
      ),
      ChatUsers(
        name: "Dora",
        messageText: "How are you ?",
        imageURL: "lib/assets/images/user5.png",
        time: "20 Dec",
      ),
      ChatUsers(
        name: "John Jane",
        messageText: "Thank you, It's awesome !",
        imageURL: "lib/assets/images/user6.png",
        time: "1 Dec",
      )
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: colorScheme.primary,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: CircleAvatar(
                      maxRadius: 3,
                      backgroundColor: colorScheme.surface,
                      child: Icon(
                        Icons.search,
                        color: colorScheme.onPrimary,
                        size: 15,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: colorScheme.primary.withOpacity(0.5))),
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: chatUsers.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Chat(),
                    ))),
                child: Column(
                  children: [
                    ConversationList(
                        name: chatUsers[index].name,
                        messageText: chatUsers[index].messageText,
                        imageURL: chatUsers[index].imageURL,
                        isMessageRead:
                            (index == 0 || index == 3) ? true : false,
                        time: chatUsers[index].time),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
