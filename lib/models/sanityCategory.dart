import 'package:sparkathon/models/sanityProduct.dart';

class SanityCategory {
  String id;
  String title;
  List<SanityProduct> products;
  String imageURL;

  SanityCategory(
      {required this.id,
      required this.title,
      required this.products,
      required this.imageURL});
}
