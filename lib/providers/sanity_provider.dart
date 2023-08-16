import 'package:flutter/material.dart';
import 'package:flutter_sanity/flutter_sanity.dart';
import 'package:flutter_sanity_image_url/flutter_sanity_image_url.dart';
import 'package:sparkathon/models/sanityBanners.dart';
import 'package:sparkathon/models/sanityCategory.dart';

import '../models/sanityFeatured.dart';
import '../models/sanityProduct.dart';
import '../widgets/sanity_image.dart';

class SanityProvider extends ChangeNotifier {
  final sanityClient =
      SanityClient(projectId: "rdn4q8zj", dataset: "production");

  List<SanityProduct> allProducts = [];

  List<SanityCategory> allCategories = [];

  List<SanityFeatured> allFeatured = [];

  List<SanityBanner> allBanners = [];

  Future<void> allProductsFetcher() async {
    if (allProducts.isNotEmpty) {
      return;
    }
    var query =
        r"*[_type == 'product']{..., 'img': {'image': photo, 'asset': photo.asset->}}";
    var res = await sanityClient.fetch(query);

    res.forEach((data) {
      var imageURL =
          urlFor(SanityImage.fromJson(data['img'] as Map<String, dynamic>))
              .url();

      var newElement = SanityProduct(
          imageURL: imageURL,
          likes: data['likes'].toString(),
          rating: data['rating'].toString(),
          dislikes: data['dislikes'].toString(),
          title: data['title'].toString(),
          comments: data['comments'] as List<dynamic>,
          description: data['description'].toString(),
          id: data['_id'].toString(),
          price: data['price'].toString());

      allProducts.add(newElement);
    });
    notifyListeners();
  }

  Future<void> allCategoriesFetcher() async {
    if (allCategories.isNotEmpty) {
      return;
    }
    var query =
        r'*[_type == "category"]{title, products[]->{_id}, "img": {"image": photo, "asset": photo.asset->}}';

    var res = await sanityClient.fetch(query);

    await allProductsFetcher();

    res.forEach((data) {
      var imageURL =
          urlFor(SanityImage.fromJson(data['img'] as Map<String, dynamic>))
              .url();

      List<SanityProduct> products = [];

      data['products'].forEach((ele) {
        var productId = ele['_id'].toString().trim();

        var product =
            allProducts.firstWhere((element) => element.id == productId.trim(),
                orElse: () => SanityProduct(
                      imageURL: '',
                      likes: '',
                      rating: '',
                      dislikes: '',
                      title: '',
                      comments: [],
                      description: '',
                      id: '-1',
                      price: '',
                    ));
        if (product.id != '-1') {
          products.add(product);
        }
      });

      var newElement = SanityCategory(
        imageURL: imageURL,
        title: data['title'].toString(),
        id: data['_id'].toString(),
        products: products,
      );

      allCategories.add(newElement);
    });

    notifyListeners();
  }

  Future<void> allFeaturedFetcher() async {
    if (allFeatured.isNotEmpty) {
      return;
    }
    var query = r'*[_type == "featured"]{title, products[]->{_id}}';

    var res = await sanityClient.fetch(query);

    await allProductsFetcher();

    res.forEach((data) {
      List<SanityProduct> products = [];

      data['products'].forEach((ele) {
        var productId = ele['_id'].toString().trim();

        var product =
            allProducts.firstWhere((element) => element.id == productId.trim(),
                orElse: () => SanityProduct(
                      imageURL: '',
                      likes: '',
                      rating: '',
                      dislikes: '',
                      title: '',
                      comments: [],
                      description: '',
                      id: '-1',
                      price: '',
                    ));
        if (product.id != '-1') {
          products.add(product);
        }
      });

      var newElement = SanityFeatured(
        title: data['title'].toString(),
        products: products,
      );

      allFeatured.add(newElement);
    });

    print(allFeatured.length);

    notifyListeners();
  }

  Future<void> allBannersFetcher() async {
    if (allBanners.isNotEmpty) {
      return;
    }
    var query =
        r'*[_type == "banner"]{title, product->{_id}, "img": {"image": image, "asset": image.asset->}}';

    var res = await sanityClient.fetch(query);

    await allProductsFetcher();

    res.forEach((data) {
      var imageURL =
          urlFor(SanityImage.fromJson(data['img'] as Map<String, dynamic>))
              .url();

      SanityProduct product = allProducts.firstWhere(
          (element) => element.id == data['product']['_id'].toString().trim(),
          orElse: () => SanityProduct(
                imageURL: '',
                likes: '',
                rating: '',
                dislikes: '',
                title: '',
                comments: [],
                description: '',
                id: '-1',
                price: '',
              ));

      var newElement = SanityBanner(
        imageURL: imageURL,
        title: data['title'].toString(),
        product: product,
      );

      allBanners.add(newElement);
    });

    notifyListeners();
  }
}
