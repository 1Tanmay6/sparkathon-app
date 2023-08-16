// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/sanityFeatured.dart';
import '../screens/Profile_detail_screen.dart';

class FeaturedExploreWidget extends StatelessWidget {
  SanityFeatured curFeatured;
  FeaturedExploreWidget({
    super.key,
    required this.curFeatured,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(curFeatured.title,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18))),
        SizedBox(
          height: media.width * 0.5,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: curFeatured.products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileDetailScreen(
                        product: curFeatured.products[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: media.width * 0.5,
                        width: media.width * 0.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            curFeatured.products[index].imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: media.width * 0.175,
                        width: media.width * 0.5,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.onPrimary),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              curFeatured.products[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${curFeatured.products[index].price}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11),
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.star_outline_rounded,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        Text(curFeatured.products[index].rating,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11))
                                      ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
