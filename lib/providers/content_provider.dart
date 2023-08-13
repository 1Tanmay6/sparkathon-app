import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../models/Video.dart';
import '../models/Comment.dart';

class ContentProvider extends ChangeNotifier {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get controller => _controller;

  final List<Video> _list = [
    Video(
      id: '1',
      title: "Snappy Skirt",
      price: 2.99,
      likes: 128.0,
      dislikes: 4.0,
      comments: [
        Comment(text: "Love this style!", author: "Fashionista22"),
        Comment(text: "Perfect fit!", author: "StyleSavvy"),
        // Add more sample comments here
      ],
      description: "Step up your fashion game with this snappy skirt",
      videoUrl: 'lib/assets/video1.mp4',
      rating: 4.8,
    ),
    Video(
      id: '2',
      title: "Loose Lehenga",
      price: 3.49,
      likes: 182.0,
      dislikes: 8.0,
      comments: [
        Comment(text: "So elegant!", author: "EthnicChic"),
        Comment(text: "Great for special occasions!", author: "FestiveVibes"),
        // Add more sample comments here
      ],
      description: "Experience the grace of a loose lehenga",
      videoUrl: 'lib/assets/video2.mp4',
      rating: 4.6,
    ),
    Video(
      id: '3',
      title: "Badass Bras",
      price: 4.99,
      likes: 356.0,
      dislikes: 15.0,
      comments: [
        Comment(text: "Confidence booster!", author: "BoldBeauty"),
        Comment(text: "Amazing designs!", author: "LingerieLover"),
        // Add more sample comments here
      ],
      description: "Unleash your inner badass with these bras",
      videoUrl: 'lib/assets/video3.mp4',
      rating: 4.2,
    ),
    Video(
      id: '4',
      title: "Breathless Bras",
      price: 5.99,
      likes: 421.0,
      dislikes: 20.0,
      comments: [
        Comment(text: "Comfortable and chic!", author: "FashionFusion"),
        Comment(text: "Highly recommended!", author: "TrendyGal"),
        // Add more sample comments here
      ],
      description: "Experience comfort like never before with breathless bras",
      videoUrl: 'lib/assets/video4.mp4',
      rating: 4.7,
    ),
    Video(
      id: '5',
      title: "Satanic Sarees",
      price: 6.99,
      likes: 289.0,
      dislikes: 10.0,
      comments: [
        Comment(text: "Unique and edgy!", author: "AlternativeDivaa"),
        Comment(
            text: "Perfect for unconventional styles!", author: "FashionRebel"),
        // Add more sample comments here
      ],
      description: "Embrace your dark side with these satanic sarees",
      videoUrl: 'lib/assets/video5.mp4',
      rating: 2.4,
    ),
    Video(
      id: '6',
      title: "Blue Beast",
      price: 3.99,
      likes: 145.0,
      dislikes: 6.0,
      comments: [
        Comment(text: "Stunning color!", author: "ColorEnthusiast"),
        Comment(text: "Looks even better in person!", author: "TrendSetter"),
        // Add more sample comments here
      ],
      description: "Conquer the fashion world with the blue beast",
      videoUrl: 'lib/assets/video6.mp4',
      rating: 4.9,
    ),
    Video(
      id: '7',
      title: "Plastic Palazzos",
      price: 4.49,
      likes: 231.0,
      dislikes: 9.0,
      comments: [
        Comment(text: "Futuristic fashion!", author: "TrendyTech"),
        Comment(text: "Unexpectedly comfortable!", author: "FashionForward"),
        // Add more sample comments here
      ],
      description: "Elevate your style with plastic palazzos",
      videoUrl: 'lib/assets/video7.mp4',
      rating: 3.3,
    ),
    Video(
      id: '8',
      title: "Magnified Midis",
      price: 3.79,
      likes: 178.0,
      dislikes: 7.0,
      comments: [
        Comment(text: "Flattering silhouette!", author: "SilhouetteQueen"),
        Comment(text: "Versatile and chic!", author: "StyleChameleon"),
        // Add more sample comments here
      ],
      description: "Enhance your look with magnified midis",
      videoUrl: 'lib/assets/video8.mp4',
      rating: 3.5,
    ),
    Video(
      id: '9',
      title: "Micro Miniskirts",
      price: 4.29,
      likes: 312.0,
      dislikes: 12.0,
      comments: [
        Comment(text: "Bold and sassy!", author: "FashionDaredevil"),
        Comment(text: "Legs for days!", author: "LeggyBeauty"),
        // Add more sample comments here
      ],
      description: "Show off your confidence with micro miniskirts",
      videoUrl: 'lib/assets/video9.mp4',
      rating: 4.7,
    ),
    Video(
      id: '10',
      title: "Sussy Stockings",
      price: 2.99,
      likes: 235.0,
      dislikes: 5.0,
      comments: [
        Comment(
            text: "Essential for every wardrobe!", author: "Fashionista101"),
        Comment(text: "Comfortable and stylish!", author: "CasualChic"),
        // Add more sample comments here
      ],
      description: "Elevate your comfort with long leggings",
      videoUrl: 'lib/assets/video10.mp4',
      rating: 4.6,
    ),
  ];

  void likesIncrementer(String id) {
    Video item = _list.firstWhere((element) => id == element.id);
    item.likes += 1.0;
    print(item.likes);
    notifyListeners();
  }

  void dislikesIncrementer(String id) {
    Video item = _list.firstWhere((element) => id == element.id);
    item.dislikes += 1.0;
    print(item.likes);
    notifyListeners();
  }

  List get list => [..._list];

  List<String> get videoUrls => _controller.index != 0
      ? []
      : _list.map((video) => video.videoUrl).toList();

  int _contentSize = 0;
  int get contentSize => _contentSize;

  set contentSize(int value) {
    _contentSize = list.length;
    notifyListeners();
  }
}
