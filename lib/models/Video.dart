import 'Comment.dart';

class Video {
  String id;
  String title;
  double price;
  double likes;
  double dislikes;
  List<Comment> comments;
  String description;
  String videoUrl;
  double rating;
  // String uid;

  Video({
    required this.id,
    required this.title,
    required this.price,
    required this.likes,
    required this.dislikes,
    required this.comments,
    required this.description,
    required this.videoUrl,
    required this.rating,
    // this.uid,
  });
}
