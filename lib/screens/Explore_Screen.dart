// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_sanity/flutter_sanity.dart';
import 'package:provider/provider.dart';

import '../providers/sanity_provider.dart';
import '../providers/explore_provider.dart';

final sanityClient = SanityClient(projectId: "rdn4q8zj", dataset: "production");

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final media = MediaQuery.of(context).size;
    final exlporeProvider =
        Provider.of<ExlporeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        title: const Text('Explore Screen'),
      ),
      body: FutureBuilder<void>(
        future: _fetchData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data.'));
          } else {
            return SingleChildScrollView(
              child: Column(children: [
                exlporeProvider.buildCategories(context, media),
                exlporeProvider.buildBannersWidget(context, media),
                ...exlporeProvider.buildFeaturedProducts(context, media),
              ]),
            );
          }
        },
      ),
    );
  }

  Future<void> _fetchData(BuildContext context) async {
    final sanityProvider = Provider.of<SanityProvider>(context, listen: false);
    final allCategories = sanityProvider.allCategories;
    final allBanners = sanityProvider.allBanners;
    final allFeatured = sanityProvider.allFeatured;
    if (allCategories.isEmpty) {
      await sanityProvider.allCategoriesFetcher();
    }
    if (allBanners.isEmpty) {
      await sanityProvider.allBannersFetcher();
    }
    if (allFeatured.isEmpty) {
      await sanityProvider.allFeaturedFetcher();
    }
  }
}
