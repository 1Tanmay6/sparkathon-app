// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/video_feed_Screen.dart';
import '../models/sanityProduct.dart';
import '../providers/content_provider.dart';

class ProfileDetailScreen extends StatelessWidget {
  final SanityProduct product;

  ProfileDetailScreen({super.key, required this.product});

  List<Widget> commentsBuilder() {
    List<Widget> comments = [];
    for (var comment in product.comments) {
      comments.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
                backgroundImage:
                    Image.asset('lib/assets/images/user.png').image,
                radius: 15),
            const SizedBox(width: 10),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Text(comment as String)),
          ],
        ),
      ));
    }
    return comments;
  }

  List<String> list = [];
  List list_all = [];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    list = Provider.of<ContentProvider>(context).videoUrls;
    list_all = Provider.of<ContentProvider>(context).list;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'Add to Cart',
          style: TextStyle(
            color: colorScheme.primary,
          ),
        ),
        icon: Icon(
          Icons.shopping_cart,
          color: colorScheme.primary,
        ),
        backgroundColor: colorScheme.surface,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: colorScheme.onPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: colorScheme.onPrimary,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VideoFeedScreen(
                            content: list_all,
                            contentSize:
                                list.length, // Pass in the number of pages
                            swipeThreshold: 0.2,
                            swipeVelocityThreshold: 1000,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            videoUrlBuilder: (int index) {
                              // Return the URL of the video for each page
                              return list[index];
                            },
                            shouldBeappbar: true,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.video_camera_back_outlined),
                    color: colorScheme.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: colorScheme.onPrimary,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                    color: colorScheme.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: colorScheme.onPrimary,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.share),
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
            elevation: 5,
            backgroundColor: colorScheme.onPrimary,
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.5),
                    ])),
                child: Text(
                  product.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              background: Image.network(
                product.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Row(children: [
                        Icon(Icons.thumb_up,
                            color: colorScheme.primary, size: 30),
                        const SizedBox(width: 5),
                        Text(product.likes.toString(),
                            style: const TextStyle(fontSize: 18))
                      ]),
                      const SizedBox(width: 20),
                      Row(children: [
                        Icon(Icons.thumb_down_alt_rounded,
                            color: colorScheme.primary, size: 30),
                        const SizedBox(width: 5),
                        Text(product.dislikes.toString(),
                            style: const TextStyle(fontSize: 18))
                      ]),
                    ]),
                    Row(children: [
                      Icon(Icons.star, color: colorScheme.primary),
                      const SizedBox(width: 5),
                      Text(product.rating.toString())
                    ])
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price', style: TextStyle(fontSize: 20)),
                        Text('\$${product.price}',
                            style: const TextStyle(fontSize: 17))
                      ])),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Text(product.description))
                      ])),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Comments',
                                style: TextStyle(fontSize: 20)),
                            Text(' (${product.comments.length})',
                                style: const TextStyle(fontSize: 20))
                          ],
                        ),
                        ...commentsBuilder(),
                        const SizedBox(height: 100),
                      ]))
            ]),
          )
        ],
      ),
    );
  }
}
