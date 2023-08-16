class SanityProduct {
  String imageURL;
  String likes;
  String rating;
  String dislikes;
  String title;
  List<dynamic> comments;
  String description;
  String id;
  String price;

  SanityProduct(
      {required this.imageURL,
      required this.likes,
      required this.rating,
      required this.dislikes,
      required this.title,
      required this.comments,
      required this.description,
      required this.id,
      required this.price});
}
