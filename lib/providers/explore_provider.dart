// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/sanityFeatured.dart';
import '../screens/product_screen.dart';
import 'sanity_provider.dart';

import '../widgets/featured_explore_widget.dart';

class ExlporeProvider extends ChangeNotifier {
  List<Widget> buildFeaturedProducts(BuildContext context, media) {
    // final sanityProvider = Provider.of<SanityProvider>(context, listen: true);
    final featuredProducts = Provider.of<SanityProvider>(
      context,
    ).allFeatured;

    List<Widget> featuredProductsWidget = [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
              child: Text('Featured Products',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22))),
        ],
      ),
    ];

    for (var element in featuredProducts) {
      SanityFeatured curItem = element;
      featuredProductsWidget.add(
        FeaturedExploreWidget(
          curFeatured: curItem,
        ),
      );
    }

    return featuredProductsWidget;
  }

  Widget buildCategories(BuildContext context, media) {
    final sanityProvider = Provider.of<SanityProvider>(context, listen: true);
    final allCategories = sanityProvider.allCategories;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Categories',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22))),
          SizedBox(
            height: media.height * 0.15,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: allCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          products: allCategories[index].products,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: media.width * 0.2,
                          width: media.width * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              allCategories[index].imageURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent
                                  ])),
                          child: Text(
                            allCategories[index].title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                          alignment: Alignment.bottomLeft,
                          height: media.width * 0.2,
                          width: media.width * 0.2,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBannersWidget(BuildContext context, media) {
    final sanityProvider = Provider.of<SanityProvider>(context);
    final allBanners = sanityProvider.allBanners;
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.network(allBanners[index].imageURL);
        },
        itemCount: allBanners.length,
      ),
    );
  }
}
